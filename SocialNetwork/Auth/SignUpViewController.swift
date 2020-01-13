//
//  SignUpViewController.swift
//  SocialNetwork
//
//  Created by LzCtrl on 9/29/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButton_Tapped(_ sender: Any) {
        Service.signUpUser(email: emailField.text!, password: passwordField.text!, name: nameField.text!, onSuccess: {
            self.performSegue(withIdentifier: "userSignedUpSegue", sender: nil)
        }) { (error) in
            self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }
    }
}
