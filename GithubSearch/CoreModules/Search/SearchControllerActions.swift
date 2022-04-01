//
//  SearchControllerActions.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import RxSwift

extension SearchViewController{
    
    func setUpActions(){
        contentView.searchTextField.rx.controlEvent([.editingChanged])
            .asObservable().subscribe({ [weak self] _ in
                self?.updateSearchValue()
            }).disposed(by: disposeBag)
        
        contentView.button.rx.tap.bind{ [weak self] in
            self?.fetchUser()
        }.disposed(by: disposeBag)
        
        searchViewModel.userResponseRx.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] response in
            
            self?.delegate?.fetchDataSucessfully(fetched: response.items.isNil(value: []))
            
        }).disposed(by:disposeBag)
    }
    
    func updateSearchValue(){
        searchValue =  contentView.searchTextField.text.orEmpty()
    }
    
    func fetchUser(){
        searchViewModel.fetchUser(query: searchValue)
    }
    
    func moveToUserView(users:[User]){
        userCoordinator?.moveToUserPage()
    }
    
    func getFetched(users list: [User]){
        UserViewModel.sharedViewModel.usersFromSource = list
        UserViewModel.sharedViewModel.getUserData.onNext("")
    }
}
