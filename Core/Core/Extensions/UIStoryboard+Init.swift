//
//  UIStoryboard+Init.swift
//  Core
//
//  Created by burak.akkaya on 23.02.2022.
//

import UIKit

public extension UIStoryboard {
    func createViewController<T: UIViewController>(identifier: String) -> T {
        guard let controller = self.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Not found view controller in storyboard: \(self.classForCoder)")
        }
        return controller
    }
}
