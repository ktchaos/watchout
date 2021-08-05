//
//  SignUpCoordinator.swift
//  WatchOut
//
//  Created by Daniel on 7/2/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import UIKit

class SignUpCoordinator: NavigationCoordinator {
    
    var rootViewController: UINavigationController
    var childCoordinators = [Coordinator]()
    var isCompleted: (() -> Void)?
    
    init() {
        self.rootViewController = UINavigationController()
    }
    
    func start() {
        let signUpViewController = SignUpViewController()
        let signUpViewModel = SignUpViewModel(coordinator: self)
        signUpViewController.bind(to: signUpViewModel)
        self.rootViewController.modalPresentationStyle = .fullScreen
        self.rootViewController.isNavigationBarHidden = true
        self.rootViewController.viewControllers = [signUpViewController]
    }
    
    func dismiss() {
        self.rootViewController.dismiss(animated: true) {
            self.isCompleted?()
        }
    }

    func watcherCreated() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        self.rootViewController.present(homeCoordinator.rootViewController, animated: true, completion: nil)
    }
}
