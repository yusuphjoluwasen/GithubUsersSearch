//
//  UIViewExtension.swift
//  iOSUtilities
//
//  Created by Guru on 29/03/2022.
//

import UIKit

extension UIView{
    public func setUpView(bgColor:UIColor = .clear, cornerRadius:CGFloat = 0.0){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
    }
}
