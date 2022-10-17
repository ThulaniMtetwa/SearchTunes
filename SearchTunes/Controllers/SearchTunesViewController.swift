//
//  SearchTunesViewController.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import UIKit

class SearchTunesViewController: UIViewController {
    
    private var searchController: UISearchController!
    @IBOutlet weak var noInternetContentView: UIView!
    @IBOutlet weak var internetStatusMessageLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!{
        didSet{
            spinner.stopAnimating()
        }
    }
    
    lazy private var viewModel: SearchTunesViewModel = {
        SearchTunesViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
        
        self.setupSearchController()
    }
    
    private func setupSearchController() {
        let resultVC = SearchResultsViewController()
        resultVC.delegate = self
        
        self.searchController = UISearchController(searchResultsController: resultVC)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.searchController = searchController
        searchController.searchBar.tintColor = UIColor.black
        searchController.searchBar.barTintColor = UIColor.black
        definesPresentationContext = true
    }
    
    @objc func showOfflineDeviceUI(notification: Notification) {
        if NetworkMonitor.shared.isActive {
            self.noInternetContentView.backgroundColor = .green
            self.internetStatusMessageLabel.text = "Connected"
            self.internetStatusMessageLabel.textColor = .white
            self.setView(view: self.noInternetContentView, hidden: true)
        } else {
            self.noInternetContentView.backgroundColor = .red
            self.internetStatusMessageLabel.text = "Not Connected"
            self.internetStatusMessageLabel.textColor = .white
            self.setView(view: self.noInternetContentView, hidden: false)
        }    }
    
    private func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
}

extension SearchTunesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchTerm(_:)), object: searchController)
        //Help not hit the server at every keystroke
        perform(#selector(self.searchTerm(_:)), with: searchController, afterDelay: 0.75)
    }
    
    @objc func searchTerm(_ searchBar: UISearchController) {
        guard let query = searchController.searchBar.text,
            !query.trimmingCharacters(in: .whitespaces).isEmpty else {
                  return
              }
        
        self.viewModel.getSearchedTunes(with: query.lowercased())
    }
    
}

extension SearchTunesViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResult: Track) {
        navigationItem.searchController?.searchBar.resignFirstResponder()
        //MARK: - Do something with searchResult selected
    }
}

extension SearchTunesViewController: SearchTunesViewPresentable {
    func updateWithResults(with resultsFromServer: [Track]) {
        guard let resultsVC = searchController.searchResultsController as? SearchResultsViewController else {
            self.showErrorMessage(with: "Unable to present your search results")
            return
        }
        resultsVC.update(with: resultsFromServer)
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
    
    func showErrorMessage(with errorMessage: String) {
        self.noInternetContentView.backgroundColor = .red
        self.internetStatusMessageLabel.text = errorMessage
        self.internetStatusMessageLabel.textColor = .white
        self.setView(view: self.noInternetContentView, hidden: false)
    }
}
