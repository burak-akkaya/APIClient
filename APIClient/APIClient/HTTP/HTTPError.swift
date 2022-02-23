//
//  HTTPError.swift
//  APIClient
//
//  Created by burak.akkaya on 27.01.2022.
//

import Foundation

public class HTTPError: Error {

    public enum HTTPErrorCode: Equatable {
        case badRequest
        case unauthorized
        case forbidden
        case notFound
        case error4xx(_ statusCode: Int)
        case serverError
        case error5xx(_ statusCode: Int)
        case unknownError

        public static func == (lhs: HTTPErrorCode, rhs: HTTPErrorCode) -> Bool {
            switch (lhs, rhs) {
            case (.badRequest, .badRequest),
                (.unauthorized, .unauthorized),
                (.forbidden, .forbidden),
                (.notFound, .notFound),
                (.serverError, .serverError),
                (.unknownError, .unknownError):
                return true
            case (.error4xx(let lhsStatusCode), .error4xx(let rhsStatusCode)):
                return lhsStatusCode == rhsStatusCode
            case (.error5xx(let lhsStatusCode), .error5xx(let rhsStatusCode)):
                return lhsStatusCode == rhsStatusCode
            default:
                return false
            }
        }

        public static func build(rawValue: Int?) -> HTTPErrorCode {
            guard let rawValue = rawValue else {
                return .unknownError
            }

            switch rawValue {
            case 400: return .badRequest
            case 401: return .unauthorized
            case 403: return .forbidden
            case 404: return .notFound
            case 402, 405...499: return .error4xx(rawValue)
            case 500: return .serverError
            case 501...599: return .error5xx(rawValue)
            default: return .unknownError
            }
        }
    }

    public var errorCode: HTTPErrorCode
    public var message: String

    public init(statusCode: Int?, message: String) {
        self.errorCode = HTTPErrorCode.build(rawValue: statusCode)
        self.message = message
    }

    public init(errorCode: HTTPErrorCode) {
        self.errorCode = errorCode
        self.message = ""
    }
}
