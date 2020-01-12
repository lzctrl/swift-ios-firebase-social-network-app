//
//  Service.swift
//  SocialNetwork
//
//  Created by Mikhail Lozovyy on 9/30/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit
import Firebase

class Service {
    
    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                onError(error!)
                return
            }
            
            uploadToDatabase(email: email, name: name, onSuccess: onSuccess)
            
        }
    }
    
    static func uploadToDatabase(email: String, name: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        
        ref.child("users").child(uid!).setValue(["email" : email, "name" : name])
        onSuccess()
    }
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
}
