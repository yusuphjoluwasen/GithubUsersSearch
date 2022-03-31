//
//  UserCell.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import UIKit
import iOSUtilities

final class UserCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .tertiaryColor, font: .systemFont14Bold,
                           numberOfLines: 3)
        return this
    }()
    
    let imageView: UIImageView = {
        let this = UIImageView()
        this.setUpImageView(image: StringConstants.userplaceholder, contentMode: .scaleToFill, cornerRadius: CGFloat.size10)
        return this
    }()
    
    let subTitleView: UIView = {
        let this = UIView()
        this.setUpView(bgColor: .secondaryColor, cornerRadius: CGFloat.size5)
        return this
    }()
    
    let subTitleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "Type: User", textColor: .tertiaryColor, font: .systemFont12Medium,
                           numberOfLines: 3)
        return this
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserCell:CollectionViewCellConfigurable {}
