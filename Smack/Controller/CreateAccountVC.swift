//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountViewSetup()
    }
    
    func createAccountViewSetup() {
        createAccountButton.layer.cornerRadius = 5
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    

}
