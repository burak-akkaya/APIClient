//
//  MockEncodable.swift
//  APIClientTests
//
//  Created by burak.akkaya on 1.02.2022.
//

import Foundation

public class MockEncodable: Encodable {
    private var name: String
    private var value: Int

    public init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
}
