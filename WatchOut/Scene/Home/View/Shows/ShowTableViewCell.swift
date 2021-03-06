//
//  ShowTableViewCell.swift
//  WatchOut
//
//  Created by Daniel on 7/3/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import UIKit
import Kingfisher

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showiIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupElements()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.showiIconImageView.image = nil
        self.titleLabel.text = nil
        self.genresLabel.text = nil
        self.yearLabel.text = nil
    }
    
    func setupElements() {
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = .init(gray: 1, alpha: 1)
        self.containerView.layer.cornerRadius = 13.0
        self.showiIconImageView.layer.cornerRadius = 35
        self.showiIconImageView.layer.borderColor = .init(gray: 1, alpha: 1)
    }
    
    func setupShowInfo(show: Show) {
        if let image = show.image?.original {
            self.showiIconImageView.kf.setImage(with: image)
        }
        self.titleLabel.text = show.name
        guard let genres = show.genres else { return }
        var result = String("")
        for g in genres {
            result = "\(g) "
        }
        self.genresLabel.text = result
        guard let year = show.premiered?.split(separator: "-")[0] else { return }
        self.yearLabel.text = String(year)
    }
}
