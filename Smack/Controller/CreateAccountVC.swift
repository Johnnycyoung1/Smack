//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var avatarImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func chooseBackgroundColorPressed(_ sender: Any) {
        
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        createNewAccount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension CreateAccountVC {
    
    func createNewAccount() {
        if (userNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "") {
            guard let userName = userNameTextField.text, let userEmail = emailTextField.text, let userPassword = passwordTextField.text else { return }
            
            AuthorizationService.shared.registerUser(email: userEmail, password: userPassword) { (success) in
                if success {
                    AuthorizationService.shared.loginUser(email: userEmail, password: userPassword, completion: { (success) in
                        if success {
                            AuthorizationService.shared.createUser(name: userName, email: userEmail, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                                if success {
                                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                                } else {
                                    debugPrint("Unable to create new user")
                                }})
                        } else {
                            debugPrint("Log-In error")
                        }})
                } else {
                    self.createdAccountErrorAlert()
                    debugPrint("Unable to register new user")
                }
            }
        } else {
            emptyTextFieldAlert()
        }
    }
    
    func emptyTextFieldAlert() {
        let alert = UIAlertController(title: "Hold on a second!", message: "Please ensure you've entered a username, e-mail, and password.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func createdAccountErrorAlert() {
        let alert = UIAlertController(title: "Oh No!", message: "We can't seem to get you registered. Please try again.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
    
    

