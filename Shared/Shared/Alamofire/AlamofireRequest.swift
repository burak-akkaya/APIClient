//
//  AlamofireRequest.swift
//  Shared
//
//  Created by burak.akkaya on 1.02.2022.
//

import Alamofire
import APIClient
import Foundation

struct AlamofireRequest {
    let httpMethod: Alamofire.HTTPMethod
    let url: URLConvertible
    let encoding: ParameterEncoding
    let parameters: Parameters?
    let header: Alamofire.HTTPHeaders?
}
