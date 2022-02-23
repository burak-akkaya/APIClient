//
//  LibraryViewController.swift
//  SampleApp
//
//  Created burak.akkaya on 23.02.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

/// LibraryViewController
public class LibraryViewController: UIViewController, LibraryView, Storyboarded  {
    
    public var presenter: LibraryPresenterProtocol!
    
    public static var storyboard: AppStoryboard {
        return .main
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }

    public func update(books: [UIBook]) {
        print(books.count)
    }
    
}
