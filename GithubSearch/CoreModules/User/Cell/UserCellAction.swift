//
//  UserCellAction.swift
//  GithubSearch
//
//  Created by Guru on 29/03/2022.
//
import UIKit
import Kingfisher

extension UserCell {
    
    func setUpActions(){
        configureView()
        configureSubviews()
        configureConstraints()
    }
    
    private func configureView(){
        backgroundColor = .primaryColor
        layer.cornerRadius = CGFloat.size10
    }
    
    private func configureSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleView)
        addSubview(subTitleLabel)
    }
    
    static func configureCellAtIndexPath(indexPath: IndexPath, item: UserDto, cell: UserCell) {
        cell.populate(item)
    }

    func populate(_ data: UserDto) {
        titleLabel.text = data.login
        imageView.loadImageUsingKingFisher(urlString: data.avatar_url, placeholder: StringConstants.userplaceholder, cornerRadius: CGFloat.size10)
    }
}
