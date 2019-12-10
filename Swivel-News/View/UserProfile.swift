//
//  UserProfile.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class UserProfile: UIViewController {

    @IBOutlet weak var userEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = Auth.auth().currentUser
        
        if let user = user {
        
          let email = user.email
          
            userEmail.text = email
        }
    }
    

    @IBAction func signout(_ sender: Any) {
           let alert = UIAlertController(title: "Are You sure you want to logout?", message: "", preferredStyle: .alert)
           
           alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
               try! Auth.auth().signOut()
               
               
               Switcher.updateRootVC()
               
               
           }))
           alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
           
           self.present(alert, animated: true)
           
           
       }

}
