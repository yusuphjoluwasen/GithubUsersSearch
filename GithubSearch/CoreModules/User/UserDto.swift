//
//  UserDto.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
struct UserDto{
    let login:String
    let avatar_url:String
    let type:String
}

extension UserDto: Hashable {
    static func == (lhs: UserDto, rhs: UserDto) -> Bool {
        return lhs.login == rhs.login && lhs.avatar_url == rhs.avatar_url && lhs.type == rhs.type
    }
 
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
        hasher.combine(avatar_url)
        hasher.combine(type)
    }
}

