//
//  LoaderSetup.swift
//  iOSUtilities
//
//  Created by Guru on 27/03/2022.
//

import Foundation
public func showLoaderProgressHUD(){
    IHProgressHUD.set(defaultMaskType: .black)
    IHProgressHUD.show()
}

public func showLoaderProgressHUDWithStatus(status:String){
    IHProgressHUD.set(defaultMaskType: .black)
    IHProgressHUD.show(withStatus: status)
}

public func dismissLoaderProgress(){
    IHProgressHUD.dismiss()
}
