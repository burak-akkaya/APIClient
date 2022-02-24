//
//  LibraryInteractor.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Combine
import APIClient

/// Library Module Interactor
public class LibraryInteractor: LibraryInteractorProtocol {
    public weak var presenter: LibraryPresenterProtocol?
    public var service: BookServiceProtocol

    init(service: BookServiceProtocol) {
        self.service = service
    }

    public func getAll(converter: @escaping (BookResponse) -> [UIBook]) -> AnyPublisher<[UIBook], HTTPError> {
        return service.all(converter: converter)
    }

}
