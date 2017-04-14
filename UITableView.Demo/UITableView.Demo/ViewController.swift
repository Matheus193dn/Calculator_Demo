//
//  ViewController.swift
//  UITableView.Demo
//
//  Created by Minh Hoang Nguyen on 04/14/17.
//  Copyright © 2017 Minh Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myArray: [[String]] = [
    
        ["iphone", "This is an Iphone", "4/4S/5/5S/5C/6/6Plus/6S/7/7Plus"],
        ["macbook", "This is an Macbook", "Macbook Pro/Air/Retina"],
        ["swift", "Swift 3.0", "Swift is a programming language"]
        
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func setPrintValues(_ cell: UITableViewCell, imageName: String, title: String, subTitle: String) {

        let imageView = cell.viewWithTag(10) as! UIImageView
        imageView.image = UIImage(named: "\(imageName)")
        
        let titleLabel = cell.viewWithTag(11) as! UILabel
        titleLabel.text = "\(title)"
        
        let subTitleLabel = cell.viewWithTag(12) as! UILabel
        subTitleLabel.text = "\(subTitle)"
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        //let count = indexPath.row
        
        //print(count)
        
        setPrintValues(cell, imageName: "\(myArray[indexPath.row][0])", title: "\(myArray[indexPath.row][1])", subTitle: "\(myArray[indexPath.row][2])")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

