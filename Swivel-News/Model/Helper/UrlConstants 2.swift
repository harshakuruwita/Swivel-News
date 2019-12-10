//
//  UrlConstants.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import Foundation

struct APPURL {
    
    private struct Domains {
        static let newsAPI_Domain = "https://newsapi.org/v2/"
        static let Local_Domain = "https://192.168.1.1.org/v2/"
        
      //  static let Localuri = "http://192.168.1.9:8080/api/v1/"
     
    }
    
    
    private  static let newsAPI_URL = Domains.newsAPI_Domain
    private  static let Local_URL = Domains.Local_Domain
  
    
    
    static var headlines: String {
        return newsAPI_URL  + "top-headlines?country=us"
    }
    
    static var allNews: String {
        return newsAPI_URL  + "everything?q="
    }
    
    
}
