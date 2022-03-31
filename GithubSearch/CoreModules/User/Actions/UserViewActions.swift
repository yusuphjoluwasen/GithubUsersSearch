//
//  UserActions.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import UIKit
import RxSwift

extension UserViewController {

    func setUpActions(){
        setUpNavigation()
        setUpObservers()
    }
    
    private func setUpNavigation(){
        setUpNavigationTitle(StringConstants.usernav)
        setUpBackButtonItemColor()
    }
    
    private func setUpObservers(){
        UserViewModel.sharedViewModel.getUserData.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] response in
            self?.updateCellData()
        }).disposed(by:disposeBag)
    }
    
    func updateCellData(){
        cellData =  UserViewModel.sharedViewModel.users
    }
    
    func handleUserScrollToTheEnd(){
        UserViewModel.sharedViewModel.userScrollToTheEnd()
        updateCellData()
    }
}
