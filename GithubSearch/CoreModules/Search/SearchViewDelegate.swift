//
//  SearchViewDelegate.swift
//  GithubSearch
//
//  Created by Guru on 28/03/2022.
//

import Foundation
protocol SearchControllerDelegate:AnyObject{
    func fetchDataSucessfully(fetched result:[User])
}

extension SearchViewController: SearchControllerDelegate{
    func fetchDataSucessfully(fetched result: [User]) {
        moveToUserView(users: result)
        getFetched(users: result)
    }
}

