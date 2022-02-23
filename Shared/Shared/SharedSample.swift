//
//  SharedSample.swift
//  Shared
//
//  Created by burak.akkaya on 26.01.2022.
//

import Alamofire
import APIClient
import Core
import Foundation

public class SharedSample: NSObject {
    public override init() {
        super.init()
    }

    public func sample() {
        print(SharedSample.className)
        let coreSample = CoreSample()
        coreSample.sample()
        let apiClient = APIClientSample()
        apiClient.sample()
    }
}
