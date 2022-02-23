//
//  RequestBuilder.swift
//  APIClient
//
//  Created by burak.akkaya on 2.02.2022.
//

import Foundation

public protocol RequestBuilder {
    associatedtype Request

    func set(method: APIClient.HTTPMethod) -> Self
    func set(url: String) -> Self
    func set(headers: [APIClient.HTTPHeader]) -> Self
    func set(encoding: APIClient.HTTPEncoding) -> Self
    func set(params: [String: Any]?) -> Self
    func build() -> Request?
}
