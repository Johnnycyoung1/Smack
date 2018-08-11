//
//  LoginVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewSetup()
    }
    
    func loginViewSetup() {
        loginButton.layer.cornerRadius = 5
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CreateAccountVCSegue", sender: nil)
    }
    
    

}
