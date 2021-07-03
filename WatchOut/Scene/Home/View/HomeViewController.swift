//
//  HomeViewController.swift
//  WatchOut
//
//  Created by Daniel on 6/30/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ViewModelBindable {

    var viewModel: HomeViewModel?
    @IBOutlet weak var searchShowTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupTableView()
    }

    func bindViewModel() {
        self.viewModel?.shows.addAndNotify(observer: self, observerBlock: { [weak self] shows in
            print(shows)
            self?.tableView.reloadData()
        })
    }
    
    func setupElements() {
        Utilities.styleTextField(self.searchShowTextField)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ShowTableViewCell", bundle: nil), forCellReuseIdentifier: "showCell")
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let query = self.searchShowTextField.text else { return }
        viewModel?.searchShows(query: query)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.shows.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showOption = viewModel?.shows.value[indexPath.row] else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowTableViewCell {
            cell.setupShowInfo(show: showOption)
            return cell
        }
        return UITableViewCell()
    }
}
