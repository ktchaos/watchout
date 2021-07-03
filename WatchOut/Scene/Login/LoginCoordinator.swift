//
//  LoginCoordinator.swift
//  WatchOut
//
//  Created by Daniel on 6/30/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: NavigationCoordinator {
    var rootViewController: UINavigationController
    var childCoordinators = [Coordinator]()
    var isCompleted: (() -> Void)?
    
    init() {
        self.rootViewController = UINavigationController()
    }
    
    func start() {
        let loginViewController = LoginViewController()
        let loginViewModel: LoginViewModel = LoginViewModel(coordinator: self)
        loginViewController.bind(to: loginViewModel)
        self.rootViewController.isNavigationBarHidden = true
        self.rootViewController.viewControllers = [loginViewController]
    }
    
    func logIn() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        self.rootViewController.present(homeCoordinator.rootViewController, animated: true, completion: nil)
    }
    
    func createAccount() {
        let signUpCoordinator = SignUpCoordinator()
        signUpCoordinator.start()
        self.rootViewController.present(signUpCoordinator.rootViewController, animated: true, completion: nil)
    }
}
