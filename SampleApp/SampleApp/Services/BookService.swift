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
    func all<T>(converter: @escaping (BookResponse) -> [T]) -> AnyPublisher<[T], HTTPError>
}

public class BookService: BookServiceProtocol{
    private var repository: BookRepositoryProtocol
    private var subscription =  Set<AnyCancellable>()

    init(repository: BookRepositoryProtocol) {
        self.repository = repository
    }

    public func all<T>(converter: @escaping (BookResponse) -> [T]) -> AnyPublisher<[T], HTTPError> {
        return self.repository.all().first().compactMap(converter).eraseToAnyPublisher()
    }
}
