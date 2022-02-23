//
//  HTTPRequestBuilderTests.swift
//  APIClientTests
//
//  Created by burak.akkaya on 1.02.2022.
//

import APIClient
import XCTest

class HTTPRequestBuilderTests: XCTestCase {

    func testBuildHTTPRequestWithEncodableObject() {
        let url = "http://www.mock.com"
        let encodable = MockEncodable(name: "MockEncodable1", value: 1)
        let header1 = HTTPHeader(key: "header1key", value: "header1value")
        let header2 = HTTPHeader(key: "header2key", value: "header2value")
        let header3 = HTTPHeader(key: "header3key", value: "header3value")
        let header4 = HTTPHeader(key: "header4key", value: "header4value")
        let header5 = HTTPHeader(key: "header5key", value: "header5value")
        let httpRequest = HTTPRequest.Builder(url: url)
            .set(encoding: .jsonEncoding)
            .set(method: .get)
            .set(raw: encodable)
            .set(header: [header1, header2])
            .build()

        httpRequest.append(header: header3)
        httpRequest.append(contentsOf: [header4, header5])

        XCTAssertEqual(httpRequest.httpMethod, .get)
        XCTAssertEqual(httpRequest.encoding, .jsonEncoding)
        XCTAssertEqual(httpRequest.url, url)
        XCTAssertEqual(httpRequest.parameters["name"] as? String, "MockEncodable1")
        XCTAssertEqual(httpRequest.parameters["value"] as? Int, 1)
        XCTAssertEqual(httpRequest.header.count, 5)
        XCTAssertTrue(httpRequest.header.contains(header1))
        XCTAssertTrue(httpRequest.header.contains(header2))
        XCTAssertTrue(httpRequest.header.contains(header3))
        XCTAssertTrue(httpRequest.header.contains(header4))
        XCTAssertTrue(httpRequest.header.contains(header5))
    }

    func testBuildHTTPRequestWithParameters() {
        let url = "http://www.mock.com"
        let parameters = ["name": "name", "surname": "Surname"]
        let header1 = HTTPHeader(key: "header1key", value: "header1value")
        let header2 = HTTPHeader(key: "header2key", value: "header2value")
        let header3 = HTTPHeader(key: "header3key", value: "header3value")
        let header4 = HTTPHeader(key: "header4key", value: "header4value")
        let header5 = HTTPHeader(key: "header5key", value: "header5value")
        let httpRequest = HTTPRequest.Builder(url: url)
            .set(encoding: .urlEncoding)
            .set(method: .post)
            .set(parameters: parameters)
            .set(header: [header1, header2])
            .build()

        httpRequest.append(header: header3)
        httpRequest.append(contentsOf: [header4, header5])

        XCTAssertEqual(httpRequest.httpMethod, .post)
        XCTAssertEqual(httpRequest.encoding, .urlEncoding)
        XCTAssertEqual(httpRequest.url, url)
        XCTAssertEqual(httpRequest.parameters["name"] as? String, "name")
        XCTAssertEqual(httpRequest.parameters["surname"] as? String, "Surname")
        XCTAssertEqual(httpRequest.header.count, 5)
        XCTAssertTrue(httpRequest.header.contains(header1))
        XCTAssertTrue(httpRequest.header.contains(header2))
        XCTAssertTrue(httpRequest.header.contains(header3))
        XCTAssertTrue(httpRequest.header.contains(header4))
        XCTAssertTrue(httpRequest.header.contains(header5))
    }

    func testBuildHTTPRequest_when_firstly_set_encodable_then_set_params_request_should_be_with_params() {
        let url = "http://www.mock.com"
        let encodable = MockEncodable(name: "MockEncodable1", value: 1)
        let parameters = ["name": "name", "surname": "Surname"]
        let header1 = HTTPHeader(key: "header1key", value: "header1value")
        let header2 = HTTPHeader(key: "header2key", value: "header2value")
        let header3 = HTTPHeader(key: "header3key", value: "header3value")
        let header4 = HTTPHeader(key: "header4key", value: "header4value")
        let header5 = HTTPHeader(key: "header5key", value: "header5value")
        let httpRequest = HTTPRequest.Builder(url: url)
            .set(encoding: .urlEncoding)
            .set(method: .post)
            .set(raw: encodable)
            .set(parameters: parameters)
            .set(header: [header1, header2])
            .build()

        httpRequest.append(header: header3)
        httpRequest.append(contentsOf: [header4, header5])

        XCTAssertEqual(httpRequest.httpMethod, .post)
        XCTAssertEqual(httpRequest.encoding, .urlEncoding)
        XCTAssertEqual(httpRequest.url, url)
        XCTAssertEqual(httpRequest.parameters["name"] as? String, "name")
        XCTAssertEqual(httpRequest.parameters["surname"] as? String, "Surname")
        XCTAssertEqual(httpRequest.header.count, 5)
        XCTAssertTrue(httpRequest.header.contains(header1))
        XCTAssertTrue(httpRequest.header.contains(header2))
        XCTAssertTrue(httpRequest.header.contains(header3))
        XCTAssertTrue(httpRequest.header.contains(header4))
        XCTAssertTrue(httpRequest.header.contains(header5))
    }

    func testBuildHTTPRequest_when_firstly_set_params_then_set_encodable_request_should_be_with_encodable() {
        let url = "http://www.mock.com"
        let encodable = MockEncodable(name: "MockEncodable1", value: 1)
        let parameters = ["name": "name", "surname": "Surname"]
        let header1 = HTTPHeader(key: "header1key", value: "header1value")
        let header2 = HTTPHeader(key: "header2key", value: "header2value")
        let header3 = HTTPHeader(key: "header3key", value: "header3value")
        let header4 = HTTPHeader(key: "header4key", value: "header4value")
        let header5 = HTTPHeader(key: "header5key", value: "header5value")
        let httpRequest = HTTPRequest.Builder(url: url)
            .set(encoding: .queryString)
            .set(method: .delete)
            .set(parameters: parameters)
            .set(raw: encodable)
            .set(header: [header1, header2])
            .build()

        httpRequest.append(header: header3)
        httpRequest.append(contentsOf: [header4, header5])

        XCTAssertEqual(httpRequest.httpMethod, .delete)
        XCTAssertEqual(httpRequest.encoding, .queryString)
        XCTAssertEqual(httpRequest.url, url)
        XCTAssertEqual(httpRequest.parameters["name"] as? String, "MockEncodable1")
        XCTAssertEqual(httpRequest.parameters["value"] as? Int, 1)
        XCTAssertEqual(httpRequest.header.count, 5)
        XCTAssertTrue(httpRequest.header.contains(header1))
        XCTAssertTrue(httpRequest.header.contains(header2))
        XCTAssertTrue(httpRequest.header.contains(header3))
        XCTAssertTrue(httpRequest.header.contains(header4))
        XCTAssertTrue(httpRequest.header.contains(header5))
    }
}
