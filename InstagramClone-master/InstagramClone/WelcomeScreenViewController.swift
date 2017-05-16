//
//  WelcomeScreenViewController.swift
//  InstagramClone
//
//  Created by Minh Hoang Nguyen on 05/15/17.
//  Copyright © 2017 iossimple. All rights reserved.
//

import UIKit

var username:String? = nil

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var userAvata: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username ?? ""
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
