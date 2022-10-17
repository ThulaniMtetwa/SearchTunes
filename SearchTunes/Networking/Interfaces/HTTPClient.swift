//
//  HTTPClient.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import Foundation

protocol HTTPClient {
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}
