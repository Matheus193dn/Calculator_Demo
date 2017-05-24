//
//  AllFeedsViewController.swift
//  InstagramClone
//
//  Created by Minh Hoang Nguyen on 5/23/17.
//  Copyright © 2017 iossimple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class AllFeedsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userArray = [String]()
    var userAvatarArray = [String]()
    var imageURLArray = [String]()
    var imageCount:Int = 0
    var imageLikeCount:[Int] = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        
        let url = "https://iossimple-instagram.herokuapp.com/api/photos"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response.response)
                print(response.data)
                print(response.result)
                
                if let json = response.result.value {
                    let json = JSON(json)
                    self.imageCount = Int(json["photosCount"].stringValue) ?? 0
                    for (_,subJson):(String, JSON) in json["photos"] {
                        self.userArray.append(subJson["author"]["username"].stringValue)
                        self.userAvatarArray.append(subJson["author"]["image"].stringValue)
                        self.imageURLArray.append(subJson["url"].stringValue)
                        self.imageLikeCount.append(Int(subJson["favoritesCount"].stringValue) ?? 0)
                    }
                    //print(self.userArray)
                    //print(self.userAvatarArray)
                    //print(self.imageURLArray)
                }
                self.tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userAvatarUrl = "https://iossimple-instagram.herokuapp.com" + userAvatarArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.userAvatar.sd_setImage(with: URL(string: userAvatarUrl))
        cell.usernameLabel.text = userArray[indexPath.row]
        cell.userpostedImage.sd_setImage(with: URL(string: imageURLArray[indexPath.row]))
        cell.totalLikes.text = "\(imageLikeCount[indexPath.row]) likes"
        
        return cell
    }

}
