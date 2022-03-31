//
//  BaseRepository.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import RxSwift
import Network

class BaseRepository {
    
    let networkHelperRX = NetworkingRX()
    let disposableBag = DisposeBag()
    
    func makeNetworkGetRequestRxWithUrlQueryParameter<R:Codable,T:Codable>(endPoint:Api,request: R,response:T.Type, params:Params,successCondition:@escaping (T) -> Bool,errorMessage:@escaping (T)->String,successAction:((T) -> ())? = nil ) -> Observable<NetworkResult<T>> {
        
        return Observable.create{ [weak self] observer in
            
            let requestObserver = self?.networkHelperRX.performGetRequestWithQueryParameter(endpoint: endPoint, returnType: T.self, request: request,params: params).subscribe(onNext: { response in
                if case let .success(data) = response{
                    if(successCondition(data)){
                        DispatchQueue.main.async {
                            observer.onNext(.success(data))
                            successAction?(data)
                        }
                    } else{
                        observer.onNext(.failure(errorMessage(data),data))
                    }} else if case let .error(error) = response {
                    observer.onNext(.error(error))
                }
            })
            return Disposables.create {
                requestObserver?.dispose()
            }
        }
    }
}
