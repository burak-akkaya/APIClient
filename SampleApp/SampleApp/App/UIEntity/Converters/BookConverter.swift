//
//  BookConverter.swift
//  SampleApp
//
//  Created by burak.akkaya on 24.02.2022.
//

import Foundation


public class BookConverter {
    public class func convert(bookResponse: BookResponse) -> [UIBook] {
        let result = bookResponse.bookList.compactMap { book -> UIBook in
            UIBook(name: book.name, author: book.authorName)
        }

        return result
    }
}
