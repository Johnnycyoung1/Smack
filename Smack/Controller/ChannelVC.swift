//
//  ChannelVC.swift
//  Smack
//
//  Created by Johnny Young on 8/10/18.
//  Copyright © 2018 Johnny Young. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    @IBOutlet weak var channelTableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelTableView.delegate = self
        channelTableView.dataSource = self
        slideMenuViewSetup()
    }
    
    func slideMenuViewSetup() {
        revealViewController().rearViewRevealWidth = view.frame.size.width - 60
        revealViewController().frontViewShadowColor = UIColor.lightGray
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "LoginVCSegue", sender: nil)
    }
    
    
    
    
}

extension ChannelVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell") as? ChannelCell {
            return cell
        } else {
            return ChannelCell()
        }
    }
    
    
}
