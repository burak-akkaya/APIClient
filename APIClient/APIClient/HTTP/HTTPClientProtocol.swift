//
//  HTTPClientProtocol.swift
//  APIClient
//
//  Created by burak.akkaya on 27.01.2022.
//

import Combine
import Core
import Foundation

public protocol HTTPClientProtocol: AutoMockable {
    func send<T: Decodable>(request: HTTPRequest) -> AnyPublisher<T, HTTPError>
}
