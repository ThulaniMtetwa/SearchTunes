//
//  Result.swift
//  SearchTunesTests
//
//  Created by Thulani Mtetwa on 2022/10/17.
//

import Foundation

extension Result {
    var error: Failure? {
        switch self {
        case .failure(let error): return error
        default: return nil
        }
    }
    
    var value: Success? {
        switch self {
        case .success(let value): return value
        default: return nil
        }
    }
}
