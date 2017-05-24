//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Viet Nguyen Tran on 5/10/17.
//  Copyright © 2017 iossimple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

private enum ScreenState {
    case none
    case signIn
    case signUp
}

class LoginViewController: UIViewController {
    
    private var state: ScreenState = .none {
        didSet {
            updateScreen(with: state)
        }
    }
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var changeStateButton: UIButton!
    
    @IBAction func pressAction(_ sender: Any) {
        if self.state == .signIn {
            signIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        } else if self.state == .signUp {
            signUp(account: accountTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        } else {
            fatalError("Login: logic of `state` is wrong, should not be .none anytime")
        }
    }
    
    @IBAction func pressChangeState(_ sender: Any) {
        // compute new state
        var toState: ScreenState = .none
        if self.state == .signIn {
            toState = .signUp
        } else if self.state == .signUp {
            toState = .signIn
        } else {
            fatalError("Login: logic of `state` is wrong, should not be .none anytime")
        }
        
        // assign new state
        self.state = toState
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.state = .signIn
    }
}

extension LoginViewController {
    fileprivate func updateScreen(with newState: ScreenState) {
        assert(newState != .none, "Login: should not update screen with state = .none")
        
        if newState == .signIn {
            accountTextField.isHidden = true
            actionButton.setTitle("Sign In", for: .normal)
            changeStateButton.setTitle("Don't have an account. Sign up.", for: .normal)
        } else if newState == .signUp {
            accountTextField.isHidden = false
            actionButton.setTitle("Sign Up", for: .normal)
            changeStateButton.setTitle("Already have an account. Sign in.", for: .normal)
        }
    }
}

extension LoginViewController {
    fileprivate func signIn(email: String, password: String) {
        let address = "https://iossimple-instagram.herokuapp.com/api/users/login"
        let params: Parameters = [
            "user": [
                "email": email,
                "password": password
            ]
        ]
        
        Alamofire.request(address, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                username = json["user"]["username"].stringValue
                self.performSegue(withIdentifier: "segue2", sender: self)
            case .failure( _):
                SVProgressHUD.showError(withStatus: "Email or Password does not correct!")
                SVProgressHUD.dismiss(withDelay: 5)
                
            }
        }
    }
    
    fileprivate func signUp(account: String, email: String, password: String) {
        let address = "https://iossimple-instagram.herokuapp.com/api/users"
        let params: Parameters = [
            "user": [
                "username": account,
                "email": email,
                "password": password
            ]
        ]
        
        Alamofire.request(address, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response.response)
                print(response.data)
                print(response.result)
                
                if let json = response.result.value {
                    let json = JSON(json)
                    username = json["user"]["username"].stringValue
                    self.performSegue(withIdentifier: "segue2", sender: self)
                }
        }
    }
}
