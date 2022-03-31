//
//  Api.swift
//  Network
//
//  Created by Guru on 27/03/2022.
//

import Foundation

public enum Api {
    case searchUser
}

extension Api: EndpointType {
    public var path: String {
        switch self {
        case .searchUser:
            return "search/users"
        }
    }
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }
    
}
