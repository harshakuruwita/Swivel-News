//
//  UserAuthentication.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import NotificationBannerSwift

class UserAuthentication: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
        
        
    }
    

   @IBAction func didTapEmailLogin(_ sender: AnyObject) {
      guard let email = self.emailField.text, let password = self.passwordField.text else {
        let banner = NotificationBanner(title: "Sorry", subtitle: "Invalid Login credentials ",  style: .danger)
                    banner.show()
        return
      }
     
   
       
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // [START_EXCLUDE]
         
            if let error = error {
              let banner = NotificationBanner(title: "Sorry", subtitle: "Invalid Login credentials ",  style: .danger)
              banner.show()
              return
            }
            strongSelf.navigationController?.popViewController(animated: true)
          print("ddddc")
          // [END_EXCLUDE]
        }
        // [END headless_email_auth]
      
    }

    
}
