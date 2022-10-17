//
//  SearchResultsViewControllerDelegate.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import Foundation

protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidSelect(searchResult: Track)
}
