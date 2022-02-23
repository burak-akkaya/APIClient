//
//  LibraryPresenter.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

/// Library Module Interactor
public class LibraryPresenter: LibraryPresenterProtocol {
    public var view: LibraryView? 
    public var interactor: LibraryInteractorProtocol 
    public var router: LibraryRouterProtocol
    
    // MARK: - Initialization
    public init(view: LibraryView, interactor: LibraryInteractorProtocol, router: LibraryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
