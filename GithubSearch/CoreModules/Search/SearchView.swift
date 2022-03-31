//
//  SearchView.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import UIKit
import iOSUtilities

final class SearchView: UIView {
    
    lazy var titleLabel:UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: StringConstants.welcome,textColor: .primaryColor, font: .systemFont36Bold)
        return this
    }()
    
    lazy var searchTextField:UITextField = {
        let this = UITextField()
        this.setUpNormalTextField(placeholderString: StringConstants.username, placehHolderColor: .primaryColor, outlineColor: .primaryColor)
        return this
    }()
    
    lazy var button:UIButton = {
        let this = UIButton(type: .system)
        this.setUpButton(text: StringConstants.search, bgcolor: .primaryColor)
        return this
    }()
   
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureSubviews()
        configureConstraints()
    }
    
    private func configureView() {
        backgroundColor = .white
    }

    private func configureSubviews() {
        addSubview(titleLabel)
        addSubview(searchTextField)
        addSubview(button)
    }
}
