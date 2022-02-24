//
//  LibraryPresenter.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Combine
import APIClient

/// Library Module Interactor
public class LibraryPresenter: LibraryPresenterProtocol {
    public var view: LibraryView? 
    public var interactor: LibraryInteractorProtocol 
    public var router: LibraryRouterProtocol
    private var subscription =  Set<AnyCancellable>()
    
    // MARK: - Initialization
    public init(view: LibraryView, interactor: LibraryInteractorProtocol, router: LibraryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    public func load() {
        self.interactor.getAll(converter: BookConverter.convert(bookResponse:)).sink{ completion in
            switch completion {
            case .failure(let error):
                print(error.message)
            default: break
            }
        } receiveValue: { [weak self] books in
            self?.view?.update(books: books)
        }.store(in: &subscription)


    }
}
