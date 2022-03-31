//
//  CollectionViewExtension.swift
//  iOSUtilities
//
//  Created by Guru on 29/03/2022.
//

import UIKit

extension UICollectionView{
    public func setUpCollectionView(bgColor:UIColor = .clear){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = bgColor
    }
}
