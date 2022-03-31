//
//  TextFieldExtension.swift
//  iOSUtilities
//
//  Created by Guru on 29/03/2022.
//
import UIKit

extension UITextField{
    public func setUpNormalTextField(placeholderString:String, rightViewString:String = "", leftViewString:String = "", keyboard_type:UIKeyboardType = .default, secureTextEntry:Bool = false,disPlayTextColor:UIColor = .gray, placehHolderColor:UIColor = .gray,font:UIFont = .systemFont14Regular, outlineColor:UIColor = .black, cornerRadius:CGFloat = 5){
        self.translatesAutoresizingMaskIntoConstraints = false
        let placeholder = NSAttributedString(string: placeholderString, attributes:
                                                [NSAttributedString.Key.foregroundColor : placehHolderColor])
        self.font = font
        self.textColor = disPlayTextColor
        self.tintColor = .orange
        self.setLeftPaddingPoints(10)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = outlineColor.cgColor
        self.attributedPlaceholder = placeholder
        self.layer.cornerRadius = cornerRadius
        self.keyboardType = keyboard_type
        if rightViewString  != ""{
            self.rightView = UIImageView(image: UIImage(named: rightViewString) ?? UIImage())
            self.rightViewMode = .always
        }
        if leftViewString  != ""{
            self.leftView = UIImageView(image: UIImage(named:leftViewString) ?? UIImage() )
            self.leftViewMode = .always
        }
    }
    
    public func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
