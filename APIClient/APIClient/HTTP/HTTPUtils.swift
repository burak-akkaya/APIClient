//
//  HTTPMethod.swift
//  APIClient
//
//  Created by burak.akkaya on 27.01.2022.
//

import Foundation

public enum HTTPMethod: String {
    case delete  = "DELETE"
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
}

public enum HTTPEncoding {
    case urlEncoding
    case queryString
    case jsonEncoding
}

public struct HTTPHeader: Equatable {
    public var key: String
    public var value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}
