//
//  Service.swift
//  SocialNetwork
//
//  Created by Mikhail Lozovyy on 9/30/19.
//  Copyright © 2019 M & P Construction, Inc. All rights reserved.
//

import UIKit

class Service {
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
}
