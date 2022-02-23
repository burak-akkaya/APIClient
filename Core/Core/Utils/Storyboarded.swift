//
//  Storyboarded.swift
//  Core
//
//  Created by burak.akkaya on 23.02.2022.
//
import UIKit

public protocol Storyboarded {
    static var storyboard: AppStoryboard { get }

    static func instantiate() -> Self

    static func instantiateViewController(withIdentifier identifier: String, bundle: Bundle?) -> Self
}

public extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        return instantiateViewController(withIdentifier: self.className)
    }

    static func instantiateViewController(withIdentifier identifier: String, bundle: Bundle? = Bundle.main) -> Self {
        let storyboard = storyboard.storyboard(inBundle: bundle)
        return storyboard.createViewController(identifier: identifier)
    }
}

public enum AppStoryboard: String {
    case main = "Main"

    func storyboard(inBundle bundle: Bundle? = Bundle.main) -> UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: bundle)
    }
}
