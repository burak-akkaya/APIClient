//
//  BookResponse.swift
//  SampleApp
//
//  Created by burak.akkaya on 23.02.2022.
//

import Foundation

public struct BookResponse: Decodable {
    public var bookList: [Book]
}

public struct Book: Decodable {
    public var id: String
    public var name: String
    public var authorName: String
    public var description: String?
}
