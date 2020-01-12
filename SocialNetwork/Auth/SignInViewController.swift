//
//  SignInViewController.swift
//  SocialNetwork
//
//  Created by Mikhail Lozovyy on 9/29/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInButton_Tapped(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.signIn(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                return
            }
            
            self.performSegue(withIdentifier: "userSignedInSegue", sender: nil)
        }
        
    }
    

}
