//
//  PreferredNewsVC.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import SwiftyJSON


class PreferredNewsVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var preferdNewsTable: UITableView!
    let allNewsIdentifire = "allNewsCell"
    
    var preferdNewsJSON:JSON = []
    var newsUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        getHeadlineNews(quarry: "bitcoin")
        self.preferdNewsTable.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    

    func getHeadlineNews(quarry: String){
        
      let url = "\(APPURL.allNews)\(quarry)"
        RestClient.makeGetRequst(url: url, delegate: self, requestFinished: #selector(self.requestFinishedGetHeadline), requestFailed: #selector(self.requestFailedGetHeadLine), tag: 1)
    }
    
    @IBAction func bitCointBtn(_ sender: AnyObject) {
        
        getHeadlineNews(quarry: "bitcoin")
    }
    
    @IBAction func appleBtn(_ sender: AnyObject) {
        
        getHeadlineNews(quarry: "apple")
    }
    
    @IBAction func earthquakeBtn(_ sender: AnyObject) {
        
        getHeadlineNews(quarry: "earthquake")
    }
    
    
    @objc func requestFinishedGetHeadline(response:ResponseSwift){
       
       do {
          let userObj = JSON(response.responseObject!)
        
        preferdNewsJSON = userObj["articles"]
        preferdNewsTable.reloadData()
           
           } catch let error {
                    print(error)
                }
                
            }
       
       @objc func requestFailedGetHeadLine(response:ResponseSwift){
              
          }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferdNewsJSON.count
       }

       // create a cell for each table view row
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:AllNewsCell = tableView.dequeueReusableCell(withIdentifier: allNewsIdentifire) as! AllNewsCell
        
       cell.titleImage.sd_setImage(with: URL(string: preferdNewsJSON[indexPath.row]["urlToImage"].stringValue), placeholderImage: UIImage(named: "placeholder.png"))
              
              cell.newsTitle.text = preferdNewsJSON[indexPath.row]["title"].stringValue
              cell.autherName.text = "By : \(preferdNewsJSON[indexPath.row]["author"].stringValue)"

          

           return cell

          
       }

       // method to run when table view cell is tapped
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        newsUrl = preferdNewsJSON[indexPath.row]["url"].stringValue
        self.performSegue(withIdentifier: "showNewsView", sender: self)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showNewsView") {
            let vc = segue.destination as! NewsView
            vc.newsUrl = newsUrl
        }
    }
}
