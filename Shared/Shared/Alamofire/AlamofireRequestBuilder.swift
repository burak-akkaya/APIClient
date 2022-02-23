//
//  AlamofireRequestBuilder.swift
//  Shared
//
//  Created by burak.akkaya on 2.02.2022.
//

import Alamofire
import APIClient
import Foundation

class AlamofireRequestBuilder: RequestBuilder {
    typealias Request = AlamofireRequest

    private var httpMethod: Alamofire.HTTPMethod?
    private var url: URL?
    private var encoding: ParameterEncoding?
    private var parameters: Parameters?
    private var headers: Alamofire.HTTPHeaders?

    func set(method: APIClient.HTTPMethod) -> Self {
        self.httpMethod = Alamofire.HTTPMethod(rawValue: method.rawValue)
        return self
    }

    func set(url: String) -> Self {
        self.url = URL(string: url)
        return self
    }

    func set(headers: [APIClient.HTTPHeader]) -> Self {
        let headers: [Alamofire.HTTPHeader] = headers.compactMap { header in
            return Alamofire.HTTPHeader(name: header.key, value: header.value)
        }
        self.headers = Alamofire.HTTPHeaders(headers)
        return self
    }

    func set(encoding: APIClient.HTTPEncoding) -> Self {
        switch encoding {
        case .queryString:
            self.encoding = URLEncoding.queryString
        case .urlEncoding:
            self.encoding = URLEncoding.default
        case .jsonEncoding:
            self.encoding = URLEncoding.httpBody
        }
        return self
    }

    func set(params: [String: Any]?) -> Self {
        self.parameters = params
        return self
    }

    func build() -> AlamofireRequest? {
        guard let httpMethod = self.httpMethod,
              let url = self.url,
              let encoding = self.encoding else {
                  return nil
              }

        return AlamofireRequest(httpMethod: httpMethod, url: url,
                                encoding: encoding, parameters: self.parameters, header: self.headers)
    }

}
