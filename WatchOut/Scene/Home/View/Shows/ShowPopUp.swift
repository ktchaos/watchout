//
//  ShowPopUp.swift
//  WatchOut
//
//  Created by Daniel on 8/5/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import UIKit
import Kingfisher

class ShowPopUp: UIView {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreAndYearLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
        animateIn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

        return nibView
    }
    
    @objc fileprivate func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    func setupElements() {
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        container = self.loadViewFromNib()
        container.layer.cornerRadius = 13
        self.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 24
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.53).isActive = true
        self.closeButton.layer.borderWidth = 2
        self.closeButton.layer.cornerRadius = 13
        self.addButton.layer.borderWidth = 2
        self.addButton.layer.cornerRadius = 13
    }
    
    func setupShow(show: Show) {
        if let image = show.image?.original {
            self.imageView.kf.setImage(with: image)
        }
        self.titleLabel.text = show.name
        
        guard let genres = show.genres else { return }
        var result = String("")
        for g in genres {
            result = "\(g) "
        }
        guard let year = show.premiered?.split(separator: "-")[0] else { return }
        self.genreAndYearLabel.text = "\(result) -  \(year)"
        
        guard let status = show.status else { return }
        guard let language = show.language else { return }
        
        self.statusLabel.text = "\(status)  -  \(language)"
        
        guard let sinopsis = show.summary else { return }
        let newSinopsis = sinopsis.replacingOccurrences(of: "<p>", with: " ").replacingOccurrences(of: "<b>", with: " ").replacingOccurrences(of: "</b>", with: " ").replacingOccurrences(of: "</p>", with: " ")
        self.summaryLabel.text = newSinopsis
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.animateOut()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    
    }
}
