//
//  EndpointType.swift
//  Network
//
//  Created by Guru on 27/03/2022.
//

import Foundation

public protocol EndpointType {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
}

public struct Params{
    let key:String?
    let value:String?
    
    public init(key:String?, value:String?){
        self.key = key
        self.value = value
    }
}
