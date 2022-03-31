//
//  ButtonExtension.swift
//  iOSUtilities
//
//  Created by Guru on 29/03/2022.
//

import UIKit

extension UIButton{
    
    public func setUpButton(text:String = "", font:UIFont = .systemFont14Regular, bgcolor:UIColor = .clear, color:UIColor = .white){
        self.setTitle(text, for: .normal)
        self.backgroundColor = bgcolor
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = CGFloat.size5
    }
}
