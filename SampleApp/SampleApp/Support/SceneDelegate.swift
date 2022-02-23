//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by burak.akkaya on 23.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? = .init(frame: UIScreen.main.bounds)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let mainPage = LibraryModule().build()
        let navigationController = UINavigationController(rootViewController: mainPage.toPresent())
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }


}

