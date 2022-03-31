//
//  SearchViewModel.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import RxSwift
import Swinject

class SearchViewModel: BaseViewModel {
    
    let searchRepository:SearchRepository
    let userResponseRx = PublishSubject<UserResponse>()

    init(searchRepository:SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func fetchUser(query:String){
        let request = UserRequest(value: query)
        makeAPICallRx(request: request, apiRequest: searchRepository.fetchUser(request:), successHandler: userResponseRx)
    }
}
