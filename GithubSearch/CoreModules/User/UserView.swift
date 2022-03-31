//
//  UserView.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import UIKit
import iOSUtilities

final class UserView: UIView {
     lazy var collectionView: UICollectionView = {
         let layout = buildLayout(itemWidth: NSCollectionLayoutDimension.fractionalWidth(0.5), itemHeight: NSCollectionLayoutDimension.absolute(190), groupHeight: NSCollectionLayoutDimension.absolute(190), horizontalSpaceBtwItems: CGFloat.margin4x, verticalSpaceBtwItem: CGFloat.margin4x,numberOfItemsInGroup:2)
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout)
        this.setUpCollectionView()
        return this
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureSubviews()
        configureConstraints()
    }
    
    private func configureView() {
        backgroundColor = .backgroundColor
    }
    
    private func configureSubviews() {
        addSubview(collectionView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.size20),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.size20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20)
        ])
    }
}
