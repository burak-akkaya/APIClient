//
//  LibraryModule
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Library Module
public class LibraryModule {
    
    public func build() -> LibraryView {
        let view = LibraryViewController.instantiate()
        let interactor = LibraryInteractor()
        let router = LibraryRouter()
        let presenter = LibraryPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}
