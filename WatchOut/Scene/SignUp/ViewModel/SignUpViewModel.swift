//
//  SignUpViewModel.swift
//  WatchOut
//
//  Created by Daniel on 7/2/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class SignUpViewModel {
    
    weak var coordinator: SignUpCoordinator?
    var errorMessage: Observable<String>
    
    init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
        self.errorMessage = .init("")
    }
    
    func registerNewWatcher(username: String, email: String, password: String, confirmPassword: String) {
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            self.errorMessage.value = "Please, fill all the fields above!"
            return
        }
        if password != confirmPassword {
            self.errorMessage.value = "Passwords don't match"
            return
        }
        if password.count < 6 {
            self.errorMessage.value = "Please, type a password with at least 6 characteres"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorMessage.value = "Error creating watcher"
                return
            }
            let dataBase = Firestore.firestore()
            dataBase.collection("watchers").addDocument(data: ["username" : username]) { error in
                if error != nil {
                    self.errorMessage.value = error!.localizedDescription
                    self.coordinator?.watcherCreated()
                }
                self.coordinator?.watcherCreated()
            }
        }
    }
    
    func goBack() {
        self.coordinator?.backToLogin()
    }
}
