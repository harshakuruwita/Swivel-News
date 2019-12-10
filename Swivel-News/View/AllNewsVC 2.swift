//
//  AllNewsVC.swift
//  Swivel-News
//
//  Created by Harsha Kuruwita on 12/10/19.
//  Copyright © 2019 Harsha Kuruwita. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import Firebase

class AllNewsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var featurenewsCollectionView: UICollectionView!
    @IBOutlet weak var allNewstable: UITableView!
    
    
    let fetureNewsIdentifire = "featureNewsCell"
    let allNewsIdentifire = "allNewsCell"
    
    var featureNewsJSON:JSON = []
    var newsUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()

       
        let db = Firestore.firestore()
        
        getHeadlineNews()
        self.allNewstable.separatorStyle = .none
        // Do any additional setup after loading the view.
        
        
    }
    

    func getHeadlineNews(){
        
      
        RestClient.makeGetRequst(url: APPURL.headlines, delegate: self, requestFinished: #selector(self.requestFinishedGetHeadline), requestFailed: #selector(self.requestFailedGetHeadLine), tag: 1)
    }
    
    func featureNewsUI(){
        
        
    }
    
    
    @objc func requestFinishedGetHeadline(response:ResponseSwift){
       
       do {
          let userObj = JSON(response.responseObject!)
        
        featureNewsJSON = userObj["articles"]
        featurenewsCollectionView.reloadData()
        allNewstable.reloadData()
           
           } catch let error {
                    print(error)
                }
                
            }
       
       @objc func requestFailedGetHeadLine(response:ResponseSwift){
              
          }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

     // make a cell for each cell index path
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fetureNewsIdentifire, for: indexPath as IndexPath) as! FeatureNewsCell

        cell.backGroundImg.sd_setImage(with: URL(string: featureNewsJSON[indexPath.row]["urlToImage"].stringValue), placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.newsTitle.text = featureNewsJSON[indexPath.row]["title"].stringValue
        cell.auther.text = "By : \(featureNewsJSON[indexPath.row]["author"].stringValue)"


         return cell
     }

     // MARK: - UICollectionViewDelegate protocol

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         // handle tap events
         newsUrl = featureNewsJSON[indexPath.row]["url"].stringValue
          self.performSegue(withIdentifier: "showNewsView", sender: self)
     }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featureNewsJSON.count
       }

       // create a cell for each table view row
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:AllNewsCell = tableView.dequeueReusableCell(withIdentifier: allNewsIdentifire) as! AllNewsCell
        
       cell.titleImage.sd_setImage(with: URL(string: featureNewsJSON[indexPath.row]["urlToImage"].stringValue), placeholderImage: UIImage(named: "placeholder.png"))
              
              cell.newsTitle.text = featureNewsJSON[indexPath.row]["title"].stringValue
              cell.autherName.text = "By : \(featureNewsJSON[indexPath.row]["author"].stringValue)"

          

           return cell

          
       }

       // method to run when table view cell is tapped
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        newsUrl = featureNewsJSON[indexPath.row]["url"].stringValue
        self.performSegue(withIdentifier: "showNewsView", sender: self)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showNewsView") {
            let vc = segue.destination as! NewsView
            vc.newsUrl = newsUrl
        }
    }
 
}
