//
//  AppCoordinator.swift
//  WatchOut
//
//  Created by Daniel on 7/2/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var isCompleted: (() -> Void)?
    var childCoordinators = [Coordinator]()
    
    let window: UIWindow
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window.windowScene = windowScene
    }
    
    func start() {
        let isSignedIn = false
            if isSignedIn {
                self.showMainRoute()
            }
            else {
                self.showAuthRoute()
            }
        
    }
    
    func showAuthRoute() {
       self.freeAllChildCoordinators()
        let coordinator: Coordinator = LoginCoordinator()
        self.start(coordinator: coordinator)
        if let rootViewController = (coordinator as? NavigationCoordinator)?.rootViewController {
            self.window.rootViewController = rootViewController
        }
        self.window.makeKeyAndVisible()
    }
    
    func showMainRoute() {
        /*self.freeAllChildCoordinators()
        guard let user = AuthManager.shared.userRepository.currentUser.value,
            let scenes = UserTabBarFactory.tabBarScenes(for: user) else {
            return
        }
        let coordinator: Coordinator = MainCoordinator(tabBarScenes: scenes)
        self.start(coordinator: coordinator)
        if let rootViewController = (coordinator as? TabBarCoordinator)?.rootViewController {
            self.window.rootViewController = rootViewController
        }
        self.window.makeKeyAndVisible()*/
    }
}

