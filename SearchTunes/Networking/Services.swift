//
//  Services.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import Foundation

struct MusicService {
    let httpClient: HTTPClient
    
    func search(_ term: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        httpClient.execute(request: .search(term: term)) { result in
            completion(self.parse(result))
        }
    }
    
    func parse(_ result: Result<Data, Error>) -> Result<[Track], Error> {
        switch result {
            
        case .success(let response):
            return Result { try JSONDecoder().decode(SearchMediaResponse.self, from: response).results }
        case .failure(let error):
            return .failure(error)
        }
    }
}
