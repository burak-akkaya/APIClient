//
//  BookRepository.swift
//  SampleApp
//
//  Created by burak.akkaya on 24.02.2022.
//
import Foundation
import Combine
import APIClient

public protocol BookRepositoryProtocol {
    func all() -> AnyPublisher<BookResponse, HTTPError>
}

public class BookRepository: BookRepositoryProtocol{
    private var apiClient: HTTPClientProtocol

    init(apiClient: HTTPClientProtocol) {
        self.apiClient = apiClient
    }

    public func all() -> AnyPublisher<BookResponse, HTTPError> {
        let request = HTTPRequest.Builder(url: "http://localhost:8080/api/sample/book/all")
            .set(method: .get)
            .build()
        return apiClient.send(request: request)
    }
}

