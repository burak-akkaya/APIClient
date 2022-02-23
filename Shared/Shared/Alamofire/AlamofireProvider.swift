//
//  AlamofireProvider.swift
//  Shared
//
//  Created by burak.akkaya on 29.01.2022.
//

import Alamofire
import APIClient
import Combine
import Foundation
import UIKit

public class AlamofireProvider: NetworkProvider {

    public init() {}

    public func send<T: Decodable>(request: APIClient.HTTPRequest) -> AnyPublisher<T, HTTPError> {
        guard let request = AlamofireRequestBuilder()
                .set(url: request.url)
                .set(method: request.httpMethod)
                .set(params: request.parameters)
                .set(headers: request.header)
                .set(encoding: request.encoding)
                .build() else {
                    return Fail(error: HTTPError(errorCode: .unknownError)).eraseToAnyPublisher()
                }

        return AF.request(request.url, method: request.httpMethod, parameters: request.parameters,
                          encoding: request.encoding, headers: request.header).validate()
            .publishDecodable(type: T.self).tryMap({ response -> T in
                guard let data = response.value else {
                    throw response.error!
                }
                return data
            }).mapError { error in
                if let afError = error.asAFError {
                    return HTTPError(statusCode: afError.responseCode, message: afError.localizedDescription)
                }
                return HTTPError(errorCode: .unknownError)
            }.eraseToAnyPublisher()
    }
}
