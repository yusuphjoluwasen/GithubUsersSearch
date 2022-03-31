//
//  GeneralExtensions.swift
//  iOSUtilities
//
//  Created by Guru on 28/03/2022.
//
import UIKit

public func setUpDidHighlightCellAnimation(action:@escaping () -> Void){
    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
        action()
    }, completion: nil)
}

public func setUpDidUnHighlightCellAnimation(action:@escaping () -> Void){
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
       
    }, completion: nil)
}
