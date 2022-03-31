//
//  CollectionViewLayoutExtension.swift
//  iOSUtilities
//
//  Created by Guru on 29/03/2022.
//

import UIKit

private func setUpCollectionViewLayout(itemWidth:NSCollectionLayoutDimension, itemHeight:NSCollectionLayoutDimension, groupWidth:NSCollectionLayoutDimension, groupHeight:NSCollectionLayoutDimension, horizontalSpaceBtwItems:CGFloat, verticalSpaceBtwItem:CGFloat, numberOfItemsInGroup:Int = 1) -> UICollectionViewCompositionalLayout{
    
    //Item
    let itemSize = NSCollectionLayoutSize(widthDimension: itemWidth, heightDimension: itemHeight)
    let itemInset:NSDirectionalEdgeInsets = .init(top: 0, leading: 0, bottom: verticalSpaceBtwItem, trailing: 0)
    let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
    itemLayout.contentInsets = itemInset
    
    // Group
    let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
    let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitem: itemLayout,count: numberOfItemsInGroup)
    groupLayout.interItemSpacing = .fixed(horizontalSpaceBtwItems)
    
    // Section
    let section = NSCollectionLayoutSection(group: groupLayout)
    return UICollectionViewCompositionalLayout(section: section)
}

//MARK:- Functions to be exposed
public func buildLayout(itemWidth:NSCollectionLayoutDimension, itemHeight:NSCollectionLayoutDimension, groupWidth:NSCollectionLayoutDimension = .fractionalWidth(1), groupHeight:NSCollectionLayoutDimension, horizontalSpaceBtwItems:CGFloat, verticalSpaceBtwItem:CGFloat, numberOfItemsInGroup:Int = 1) -> UICollectionViewCompositionalLayout{
    
    return setUpCollectionViewLayout(itemWidth: itemWidth, itemHeight: itemHeight, groupWidth: groupWidth, groupHeight: groupHeight, horizontalSpaceBtwItems: horizontalSpaceBtwItems, verticalSpaceBtwItem: verticalSpaceBtwItem, numberOfItemsInGroup: numberOfItemsInGroup)
}
