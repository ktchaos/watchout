//
//  LoginViewController.swift
//  WatchOut
//
//  Created by Daniel on 6/16/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ViewModelBindable {

    var viewModel: LoginViewModel?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    func bindViewModel() {
        self.viewModel?.errorMessage.addObserver(self, observerBlock: { message in
            self.errorLabel.text = message
            self.errorLabel.isHidden = false
        })
    }

    func setupElements() {
        self.loginButton.layer.cornerRadius = 13
        self.registerButton.layer.cornerRadius = 15
        self.registerButton.layer.borderWidth = 1
        self.registerButton.layer.borderColor = UIColor.init(red: 126, green: 119, blue: 132, alpha: 1).cgColor
        self.errorLabel.isHidden = true
        guard let iconEmail = UIImage(systemName: "envelope") else { return }
        guard let iconLock = UIImage(systemName: "lock") else { return }
        self.emailTextField.setIcon(iconEmail)
        self.passwordTextField.setIcon(iconLock)
        Utilities.styleTextField(self.emailTextField)
        Utilities.styleTextField(self.passwordTextField)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = self.emailTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        viewModel?.logIn(email: email, password: password)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        viewModel?.createAccount()
    }
}
