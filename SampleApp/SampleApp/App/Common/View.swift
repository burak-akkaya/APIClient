//
//  View.swift
import UIKit

public protocol View: AnyObject, Presentable {
    var pageName: String? { get }
    var shouldTrackNavigation: Bool { get }
}

extension UIViewController: View {
    public var pageName: String? {
        return Self.className.lowercased()
    }

    public var shouldTrackNavigation: Bool {
        return false
    }
}
