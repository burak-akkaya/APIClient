//
//  LibraryModule
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import APIClient
import Shared

// MARK: - Library Module
public class LibraryModule {
    
    public func build() -> LibraryView {
        let provider = AlamofireProvider()
        let apiClient = HTTPClient(provider: provider)
        let repository = BookRepository(apiClient: apiClient)
        let service = BookService(repository: repository)
        let view = LibraryViewController.instantiate()
        let interactor = LibraryInteractor(service: service)
        let router = LibraryRouter()
        let presenter = LibraryPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}
