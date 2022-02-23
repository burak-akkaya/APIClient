//
//  LibraryContracts.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - LibraryInteractorProtocol
public protocol LibraryInteractorProtocol: Interactor {
    var presenter: LibraryPresenterProtocol? {get set}
}

// MARK: - LibraryInteractorProtocol
public protocol LibraryPresenterProtocol: Presenter {
    var view: LibraryView? {get set}
    var interactor: LibraryInteractorProtocol {get set}
    var router: LibraryRouterProtocol {get set}
}

// MARK: - LibraryRouterProtocol
public protocol LibraryRouterProtocol: Router {
    var presenter: LibraryPresenterProtocol? {get set}
    var viewController: UIViewController? { get set}
}

// MARK: - LibraryViewProtocol
public protocol LibraryView: View {
    var presenter: LibraryPresenterProtocol! {get set}
}
