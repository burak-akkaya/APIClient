//
//  NetworkProviderTests.swift
//  APIClientTests
//
//  Created by burak.akkaya on 31.01.2022.
//

@testable import APIClient
import Combine
import SwiftyMocky
import XCTest

class NetworkProviderTests: XCTestCase {
    var mockNetworkProvider: NetworkProviderMock!
    var mockRequest: HTTPRequest!
    var httpClient: HTTPClient!

    override func setUp() {
        super.setUp()
        self.mockNetworkProvider = NetworkProviderMock()
        self.mockRequest = .mock
        self.httpClient = HTTPClient(provider: mockNetworkProvider)
    }

    override func tearDown() {
        super.tearDown()
        self.mockNetworkProvider = nil
        self.mockRequest = nil
        self.httpClient = nil
    }

    func test_when_networkprovider_return_success_then_apiclient_receive_success_response() {
        let expectedResponse = MockDecodable(id: 1)

        Given(mockNetworkProvider,
              .send(request: .value(mockRequest),
                    willReturn: Just(expectedResponse)
                        .setFailureType(to: HTTPError.self)
                        .eraseToAnyPublisher()))

        let publisher: AnyPublisher<MockDecodable, HTTPError> = httpClient.send(request: mockRequest)
        let expectation = XCTestExpectation(description: "Waiting for response")

        _ = publisher.sink { subscription in
            switch subscription {
            case .failure:
                XCTFail("Unexpected Error")
            default:
                // do nothing, it's a completion event
                break
            }
             // do nothing, it's a completion event
        } receiveValue: { actualResponse in
            XCTAssertEqual(actualResponse, expectedResponse)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
        Verify(mockNetworkProvider, 1, .send(request: .any))
    }

    func test_when_networkprovider_return_error_then_apiclient_receive_failure_response() {
        let expectedError = HTTPError(errorCode: .badRequest)

        Given(mockNetworkProvider,
              .send(request: .value(mockRequest),
                    willReturn: Fail<MockDecodable, HTTPError>(error: expectedError).eraseToAnyPublisher()))

        let publisher: AnyPublisher<MockDecodable, HTTPError> = httpClient.send(request: mockRequest)
        let expectation = XCTestExpectation(description: "Waiting for response")

        _ = publisher.sink { subscription in
            switch subscription {
            case .failure(let httpError):
                if case .badRequest = httpError.errorCode {
                    expectation.fulfill()
                } else {
                    XCTFail("Unexpected Error")
                }
            default: break
                // do nothing, it's a completion event
            }
        } receiveValue: { _ in
            XCTFail("Unexpected Response")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
        Verify(mockNetworkProvider, 1, .send(request: .any))
    }
}
