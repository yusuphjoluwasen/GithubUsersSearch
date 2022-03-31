//
//  SearchViewConstraints.swift
//  GithubSearch
//
//  Created by Guru on 29/03/2022.
//
import UIKit
extension SearchView{
    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.size30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size30)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.size30),
            searchTextField.heightAnchor.constraint(equalToConstant: CGFloat.size50),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size30),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size30)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: CGFloat.size35),
            button.heightAnchor.constraint(equalToConstant: CGFloat.size45),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size30),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size30)
        ])
    }
}
