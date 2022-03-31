//
//  Response.swift
//  Network
//
//  Created by Guru on 27/03/2022.
//
import Foundation

public struct Response {
    fileprivate var data: Data
    public init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension Decodable {
    public static func map(JSONString:String) -> Self? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Self.self, from: Data(JSONString.utf8))
        } catch let error {
            print(error)
            return nil
        }
    }
}

public enum NetworkResult<T>{
    case success(T)
    case failure(String,T?)
    case error(Error?)
    case other(T)
}

