//
//  File.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
struct UserRequest: Codable{
    let value:String?
}

struct UserResponse: Codable{
    let message:String?
    let items:[User]?
}

struct User:Codable{
    let login:String?
    let avatar_url:String?
    let type:String?
}
