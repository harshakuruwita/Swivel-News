//
//  RestClient.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RestClient: NSObject {
    
    class func makeGetRequst(url:String, delegate:AnyObject, requestFinished:Selector, requestFailed:Selector, tag:Int){
           
                   let Auth_header: HTTPHeaders = [
                    "X-Api-Key": AppConstants.newsApi_key,
                    
                       
                   ]
                   Alamofire.request(url, method: .get ,encoding: JSONEncoding.default, headers: Auth_header)
                       .responseJSON { response in
                           switch response.result {
                           case .success(let value):
                               print("Validation Successful")
                               
                               let json = JSON(value)
                               let responseHandler = ResponseSwift()
                               responseHandler.tag = tag
                               responseHandler.responseObject = json
                               _ = delegate.perform(requestFinished, with: responseHandler)
                           case .failure(let error):
                               
                               let responseHandler = ResponseSwift()
                               responseHandler.tag = tag
                               _ =  delegate.perform(requestFailed, with: responseHandler)
                               print(error)
                           }
                   }
               
           }

}
