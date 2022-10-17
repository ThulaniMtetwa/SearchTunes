//
//  SearchResultTableViewCell.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    static let identifier = String(describing: self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell(with track: Track) {
        self.textLabel?.text = track.trackName
        self.detailTextLabel?.text = track.artistName
    }
}
