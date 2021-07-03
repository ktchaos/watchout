//
//  HomeCoordinator.swift
//  WatchOut
//
//  Created by Daniel on 7/3/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: NavigationCoordinator {
    var rootViewController: UINavigationController
    var childCoordinators = [Coordinator]()
    var isCompleted: (() -> Void)?
    
    init() {
        self.rootViewController = UINavigationController()
    }
    
    func start() {
        let homeViewController = HomeViewController()
        let homeViewModel: HomeViewModel = HomeViewModel(coordinator: self)
        homeViewController.bind(to: homeViewModel)
        self.rootViewController.isNavigationBarHidden = true
        self.rootViewController.modalPresentationStyle = .fullScreen
        self.rootViewController.viewControllers = [homeViewController]
    }
}
