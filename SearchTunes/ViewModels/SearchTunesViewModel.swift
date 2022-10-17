//
//  SearchTunesViewModel.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/17.
//

import Foundation

protocol SearchTunesViewPresentable: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorMessage(with errorMessage: String)
    func updateWithResults(with resultsFromServer: [Track])
}

class SearchTunesViewModel: NSObject {
    
    private(set) weak var delegate: SearchTunesViewPresentable?
    
    init(delegate : SearchTunesViewPresentable) {
        self.delegate = delegate
    }
    
    func getSearchedTunes(with term: String) {
        let httpClient = HTTPClientImplementation()
        let client = MusicService(httpClient: httpClient)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            self.delegate?.showLoadingIndicator()
            client.search(term, completion: { (result) in
                
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.delegate?.hideLoadingIndicator()
                        self.delegate?.updateWithResults(with: data)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.delegate?.hideLoadingIndicator()
                        self.delegate?.showErrorMessage(with: error.localizedDescription)
                    }
                }
            })
        }
        
    }
}
