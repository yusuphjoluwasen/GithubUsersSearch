//
//  CellConstraints.swift
//  GithubSearch
//
//  Created by Guru on 29/03/2022.
//

import UIKit

extension UserCell{
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.size15),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.size60),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.size60),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.size10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            subTitleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.size20),
            subTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            subTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            subTitleView.heightAnchor.constraint(equalToConstant: CGFloat.size30)
        ])

        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: subTitleView.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: subTitleView.centerYAnchor),
        ])
    }
}
