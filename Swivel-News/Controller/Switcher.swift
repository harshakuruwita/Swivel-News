//
//  Switcher.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit

class Switcher {
    
    static func updateRootVC(){
        
       // let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        let isLogin = true
        var rootVC : UIViewController?
        
    
        
        
        if(isLogin){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Application") as! ApplicationNavigation
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Authentication") as! AuthenticationNavigation
        }
        
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
              appDelegate.window?.rootViewController = rootVC
        
    }
    
}
