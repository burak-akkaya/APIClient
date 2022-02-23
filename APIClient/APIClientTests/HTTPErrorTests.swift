//
//  HTTPErrorTests.swift
//  APIClientTests
//
//  Created by burak.akkaya on 1.02.2022.
//

@testable import APIClient
import XCTest

class HTTPErrorTests: XCTestCase {

    public func testBadRequestInitialization() {
        let badRequestErrorCode = HTTPError.HTTPErrorCode.build(rawValue: 400)
        XCTAssertEqual(badRequestErrorCode, .badRequest)
    }

    public func testUnauthorizedInitialization() {
        let unauthorizedErrorCode = HTTPError.HTTPErrorCode.build(rawValue: 401)
        XCTAssertEqual(unauthorizedErrorCode, .unauthorized)
    }

    public func testForbiddenInitialization() {
        let forbiddenErrorCode = HTTPError.HTTPErrorCode.build(rawValue: 403)
        XCTAssertEqual(forbiddenErrorCode, .forbidden)
    }

    public func testNotFoundInitialization() {
        let notFoundErrorCode = HTTPError.HTTPErrorCode.build(rawValue: 404)
        XCTAssertEqual(notFoundErrorCode, .notFound)
    }

    public func testServerErrorInitialization() {
        let serverErrorCode = HTTPError.HTTPErrorCode.build(rawValue: 500)
        XCTAssertEqual(serverErrorCode, .serverError)
    }

    public func test4xxErrorInitialization() {
        let errorCode = HTTPError.HTTPErrorCode.build(rawValue: 421)
        XCTAssertEqual(errorCode, .error4xx(421))
    }

    public func test5xxErrorInitialization() {
        let errorCode = HTTPError.HTTPErrorCode.build(rawValue: 523)
        XCTAssertEqual(errorCode, .error5xx(523))
    }

    public func testUnexpectedErrorCode() {
        let errorCode = HTTPError.HTTPErrorCode.build(rawValue: 321)
        XCTAssertEqual(errorCode, .unknownError)
    }

    public func testHTTPErrorInitializationWithStatusCode() {
        let errorMessage = "Error Message"
        let httpError = HTTPError(statusCode: 433, message: errorMessage)

        XCTAssertEqual(httpError.errorCode, .error4xx(433))
        XCTAssertEqual(httpError.message, errorMessage)
    }

    public func testHTTPErrorInitializationWithErrorCode() {
        let httpError = HTTPError(errorCode: .badRequest)

        XCTAssertEqual(httpError.errorCode, .badRequest)
    }
}
