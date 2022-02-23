//
//  HTTPMock.swift
//  APIClientTests
//
//  Created by burak.akkaya on 31.01.2022.
//

import Foundation
@testable import APIClient

public extension HTTPRequest {
    static var mock: HTTPRequest {
        return HTTPRequest.Builder(url: "https://www.google.com").build()
    }
}
