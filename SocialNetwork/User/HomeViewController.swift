//
//  HomeViewController.swift
//  SocialNetwork
//
//  Created by LzCtrl on 9/30/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeInLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        Service.getUserInfo(onSuccess: {
            self.welcomeInLabel.text = "Welcome in \(defaults.string(forKey: "userNameKey")!)"
        }) { (error) in
            self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }
    }
    
    @IBAction func logOutButton_Tapped(_ sender: Any) {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError {
            self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
        }
    }
    

}
