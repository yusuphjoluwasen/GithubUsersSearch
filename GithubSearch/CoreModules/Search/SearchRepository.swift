//
//  GithubRepository.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import RxSwift
import Network

protocol SearchRepository {
    func fetchUser(request: UserRequest) -> Observable<NetworkResult<UserResponse>>
}

class SearchRepositoryImpl: BaseRepository, SearchRepository{

    func fetchUser(request: UserRequest) -> Observable<NetworkResult<UserResponse>> {
        let param = Params(key: "q", value: request.value)
        return makeNetworkGetRequestRxWithUrlQueryParameter(endPoint: .searchUser, request: request, response: UserResponse.self, params: param, successCondition: { response in
            response.message == nil
        }, errorMessage: { response in
            if let error = response.message {
                return error
            }else{
                return "Something went wrong"
            }
        })
    }
}
