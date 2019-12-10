//
//  NewsView.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import WebKit


class NewsView: UIViewController {

    @IBOutlet weak var newsWebView: WKWebView!
    var newsUrl =  ""
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let link = URL(string:newsUrl)!
        let request = URLRequest(url: link)
        newsWebView.load(request)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
