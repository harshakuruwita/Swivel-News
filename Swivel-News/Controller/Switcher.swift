//
//  Switcher.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Switcher {
     var handle: AuthStateDidChangeListenerHandle?
    static func updateRootVC(){
        
        var rootVC : UIViewController?
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
              rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "applicationNavigation") as! ApplicationNavigation
                
            } else {
                rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Authentication") as! AuthenticationNavigation
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
        }
       
        
  
        
        
        
         
        
    }
    
}
