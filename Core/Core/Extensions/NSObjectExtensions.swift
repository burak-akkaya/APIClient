//
//  NSObjectExtensions.swift
//  Shared
//
//  Created by burak.akkaya on 21.01.2022.
//

import Foundation

public extension NSObject {
    // MARK: - Static Properties
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
