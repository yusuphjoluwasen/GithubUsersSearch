//
//  BaseviewConytroller.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import UIKit
import RxCocoa
import RxSwift
import iOSUtilities

class BaseViewController: UIViewController{
    let disposeBag = DisposeBag()
   
    public func setUpObserversForViewModel(baseViewModel:BaseViewModel){
        setUpLoadingObserver(baseViewModel: baseViewModel)
        setUpErrorObserver(baseViewModel: baseViewModel)
    }
    
    private func setUpLoadingObserver(baseViewModel:BaseViewModel){
        baseViewModel.isLoading.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] isLoading in
            if (self?.navigationController?.topViewController == self) {
                if(isLoading){
                    showLoaderProgressHUDWithStatus(status: "Searching...")
                }else{
                    dismissLoaderProgress()
                }
            }
        }).disposed(by: disposeBag)
    }
    
    private func setUpErrorObserver(baseViewModel:BaseViewModel){
        baseViewModel.error.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] errorMessage in
            if (self?.navigationController?.topViewController == self) {
                self?.showError(errorMessage: errorMessage)
            }
            
        }).disposed(by: disposeBag)
    }
    
    func showError(errorMessage:String){
        setUpErrorPopUp(errorString: errorMessage)
    }
    
    func setUpErrorPopUp(errorString:String){
        simpleAlert(title: "Error", message: errorString)
    }
}
