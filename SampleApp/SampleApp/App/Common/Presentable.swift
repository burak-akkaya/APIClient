//
//  Presentable.swift
import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController
}

public extension Presentable where Self: UIViewController {
    func toPresent() -> UIViewController {
        return self
    }
}
