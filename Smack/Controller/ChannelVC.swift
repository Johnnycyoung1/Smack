//
//  ChannelVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenuViewSetup()
    }
    
    func slideMenuViewSetup() {
        revealViewController().rearViewRevealWidth = view.frame.size.width - 60
        revealViewController().frontViewShadowColor = UIColor.lightGray
    }
}
