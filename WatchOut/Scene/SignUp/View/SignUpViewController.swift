//
//  SignUpViewController.swift
//  WatchOut
//
//  Created by Daniel on 7/2/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, ViewModelBindable {

    var viewModel: SignUpViewModel?
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButtonTapped: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    func setupElements() {
        self.errorLabel.isHidden = true
        self.registerButtonTapped.layer.cornerRadius = 15
        Utilities.styleTextField(self.usernameTextField)
        Utilities.styleTextField(self.emailTextField)
        Utilities.styleTextField(self.passwordTextField)
        Utilities.styleTextField(self.confirmPasswordTextField)
    }

    func bindViewModel() {
        self.viewModel?.errorMessage.addObserver(self, observerBlock: { message in
            self.errorLabel.text = message
            self.errorLabel.isHidden = false
        })
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let username = self.usernameTextField.text else { return }
        guard let email = self.emailTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        guard let confirmPassword = self.confirmPasswordTextField.text else { return }
        
        viewModel?.registerNewWatcher(username: username,email: email, password: password, confirmPassword: confirmPassword)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        viewModel?.goBack()
    }
}
