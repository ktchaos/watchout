//
//  LoginViewModel.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import Firebase

class LoginViewModel {
    
    weak var coordinator: LoginCoordinator?
    var errorMessage: Observable<String>
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        self.errorMessage = .init("")
    }
    
    func logIn(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            self.errorMessage.value = "Fill all the fields"
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorMessage.value = error?.localizedDescription ?? "Incorrect credentials"
                return
            }
            else {
                self.coordinator?.logIn()
                return
            }
        }
    }
    
    func createAccount() {
        coordinator?.createAccount()
    }
}
