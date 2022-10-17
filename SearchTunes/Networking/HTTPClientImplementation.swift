//
//  HTTPClientImplementation.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import Foundation

class HTTPClientImplementation: HTTPClient {
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let config = URLSessionConfiguration.default
        config.allowsExpensiveNetworkAccess = false
        config.allowsConstrainedNetworkAccess = false
        config.waitsForConnectivity = true
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession.init(configuration: config)
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(error!))
                }
            }
        }.resume()
    }
}


extension URLRequest {
    static func search(term: String) -> URLRequest {
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = [
            .init(name: "media", value: "music"),
            .init(name: "entity", value: "song"),
            .init(name: "term", value: "\(term)")
        ]
        
        return URLRequest(url: components!.url!)
    }
}
