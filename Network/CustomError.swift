//
//  CustomError.swift
//  Network
//
//  Created by Guru on 27/03/2022.
//

import Foundation
public struct MyError: Error {
    let msg: String
}

extension MyError: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString(msg, comment: "")
    }
}

enum GuruCustomError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
    
    static func checkErrorCode(_ errorCode: Int) -> MyError {
        switch errorCode {
        case 400:
            return MyError(msg: "bad request")
        case 401:
            return MyError(msg: "")
        case 404:
            return MyError(msg: "")
        default:
            return MyError(msg: "")
        }
    }
}

extension Error {
    
    var isConnectivityError: Bool {
        let code = (self as NSError).code
        
        if (code == NSURLErrorTimedOut) {
            return true // time-out
        }
        
        if (self._domain != NSURLErrorDomain) {
            return false // Cannot be a NSURLConnection error
        }
        
        switch (code) {
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost:
            return true
        default:
            return false
        }
    }
}
