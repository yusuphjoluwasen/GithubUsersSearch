//
//  BaseViewModel.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import RxSwift
import Foundation
import Network

class BaseViewModel {
    let disposableBag = DisposeBag()
    public let error:PublishSubject<String> = PublishSubject()
    public let isLoading:PublishSubject<Bool> = PublishSubject()
    
    func makeAPICallRx <R:Codable,T:Codable>(request:R,apiRequest:(R) -> Observable<NetworkResult<T>>,successHandler:PublishSubject<T>,showLoading:Bool = true,onSuccessOperation:((T) -> ())? = nil
        ,showError:Bool = true,onFailureOperation: (() -> () )? = nil,handleFailureOperation:((T) -> () )? = nil ,handleLoading:PublishSubject<Bool>? = nil){
        if let handleLoadingCustom = handleLoading {
            handleLoadingCustom.onNext(true)
        }else{
            if(showLoading){
                self.isLoading.onNext(true)
            }
        }
        
        apiRequest(request).subscribe(onNext: { [weak self] response in
            if let handleLoadingCustom = handleLoading {
                handleLoadingCustom.onNext(false)
            }else{
                if(showLoading){
                    self?.isLoading.onNext(false)
                }
            }
            if case let .success(data) = response {
                onSuccessOperation?(data)
                successHandler.onNext(data)
            }else if case let .failure(errorMessage,data) = response {
                if(showError){
                    if let handleFailure = handleFailureOperation {
                        if let responseData = data{
                            handleFailure(responseData)
                        }
                    }else{
                        self?.error.onNext(errorMessage)
                    }
                }
            }else if case let .error(error) = response{
                if(showError){
                    if ((error?.localizedDescription.contains("The Internet connection appears to be offline.")) != nil){
                        self?.error.onNext(error?.localizedDescription ?? "Bad Internet Connection")
                    }else{
                        self?.error.onNext(error?.localizedDescription ?? "Something Went Wrong")
                    }
                }
            }
        }).disposed(by: disposableBag)
    }
}

