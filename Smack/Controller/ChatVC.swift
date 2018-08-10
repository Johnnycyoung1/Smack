//
//  ChatVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButtonPressed()
        
    }
    
    func menuButtonPressed() {
        menuButton.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
   

}
