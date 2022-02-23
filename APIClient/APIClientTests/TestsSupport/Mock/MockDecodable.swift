//
//  MockDecodable.swift
//  APIClientTests
//
//  Created by burak.akkaya on 31.01.2022.
//

import Foundation

public class MockDecodable: Decodable, Equatable {
    let id: Int

    public init(id: Int) {
        self.id = id
    }

    public static func == (lhs: MockDecodable, rhs: MockDecodable) -> Bool {
        return lhs.id == rhs.id
    }
}

