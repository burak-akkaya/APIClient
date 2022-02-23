//
//  BookService.swift
//  SampleApp
//
//  Created by burak.akkaya on 23.02.2022.
//
import Foundation
import Combine
import APIClient

public protocol BookServiceProtocol {
    func all() -> AnyPublisher<BookResponse, HTTPError>
}

public class BookService: BookServiceProtocol{
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
