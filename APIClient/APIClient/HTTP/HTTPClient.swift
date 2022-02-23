//
//  HTTPClient.swift
//  APIClient
//
//  Created by burak.akkaya on 28.01.2022.
//

import Combine
import Foundation

public class HTTPClient: HTTPClientProtocol {
    private let networkProvider: NetworkProvider

    public init(provider: NetworkProvider) {
        self.networkProvider = provider
    }

    public func send<T: Decodable>(request: HTTPRequest) -> AnyPublisher<T, HTTPError> {
        return networkProvider.send(request: request)
    }

}
