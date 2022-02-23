//
//  HTTPRequest.swift
//  APIClient
//
//  Created by burak.akkaya on 27.01.2022.
//

import Foundation

public class HTTPRequest: NSObject {
    public let httpMethod: HTTPMethod
    public let url: String
    public let parameters: [String: Any]
    public var header: [HTTPHeader]
    public var encoding: HTTPEncoding

    private init(url: String, method: HTTPMethod, parameters: [String: Any], encoding: HTTPEncoding, header: [HTTPHeader] = []) {
        self.httpMethod = method
        self.parameters = parameters
        self.url = url
        self.encoding = encoding
        self.header = header
    }

    public func append(header: HTTPHeader) {
        self.header.append(header)
    }

    public func append(contentsOf headers: [HTTPHeader]) {
        self.header.append(contentsOf: headers)
    }

    public class Builder {
        private var httpMethod: HTTPMethod
        private var parameters: [String: Any]
        private var url: String
        private var encoding: HTTPEncoding
        private var header: [HTTPHeader]

        public init(url: String) {
            self.url = url
            self.httpMethod = .get
            self.encoding = .urlEncoding
            self.parameters = [:]
            self.header = []
        }

        public func set(encoding: HTTPEncoding) -> Self {
            self.encoding = encoding
            return self
        }

        public func set(method: HTTPMethod) -> Self {
            self.httpMethod = method
            return self
        }

        public func set(raw: Encodable) -> Self {
            self.parameters = raw.dictionary ?? [:]
            return self
        }

        public func set(header: [HTTPHeader]) -> Self {
            self.header = header
            return self
        }

        public func set(parameters: [String: Any]) -> Self {
            self.parameters = parameters
            return self
        }

        public func build() -> HTTPRequest {
            return HTTPRequest(url: self.url, method: self.httpMethod, parameters: self.parameters,
                               encoding: self.encoding, header: self.header)
        }
    }
}
