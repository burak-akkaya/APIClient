//
//  LibraryRouter.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - LibraryRouter
public class LibraryRouter: LibraryRouterProtocol {
    public weak var presenter: LibraryPresenterProtocol?
    public weak var viewController: UIViewController?
}
