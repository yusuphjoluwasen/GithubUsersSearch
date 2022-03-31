//
//  Optionals.swift
//  iOSUtilities
//
//  Created by Guru on 19/09/2021.
//

import Foundation


extension Optional {
    public func isNil<T>(value: T) -> T {
        if self != nil {
            return self as! T
        }
        return value
    }
    
    public func or(other: Wrapped) -> Wrapped {
        if let ret = self {
            return ret
        } else {
            return other
        }
    }
}

extension Optional where Wrapped == String {
    public func orEmpty() -> String {
        return self.or(other: "")
    }
}
