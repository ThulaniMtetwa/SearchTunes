//
//  MockHTTPClientImplementation.swift
//  SearchTunesTests
//
//  Created by Thulani Mtetwa on 2022/10/17.
//

import Foundation
import XCTest

@testable import SearchTunes

class MockHTTPClientImplementation: HTTPClient {
    var inputRequest: URLRequest?
    var executeCalled = false
    var result: Result<Data, Error>?
    
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        executeCalled = true
        inputRequest = request
        result.map(completion)
    }
}
