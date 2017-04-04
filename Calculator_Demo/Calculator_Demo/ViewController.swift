//
//  ViewController.swift
//  Calculator_Demo
//
//  Created by Matheus on 4/4/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var input2TF: UITextField!
    @IBOutlet weak var outputTF: UITextField!
    var type: operatorS = .none
    

    
    @IBAction func btnPress(_ sender: UIButton) {
        if sender.tag != 5 {
            switch sender.tag {
            case 1:
                type = .plus
                sender.backgroundColor = UIColor.brown
            case 2:
                type = .minus
                sender.backgroundColor = UIColor.brown
            case 3:
                type = .multiply
                sender.backgroundColor = UIColor.brown
            case 4:
                type = .divide
                sender.backgroundColor = UIColor.brown
            default:
                type = .none
            }
        }
    }
    
    @IBAction func resultBtn(_ sender: UIButton) {
        if inputTF.text != nil && input2TF.text != nil {
            if input2TF.text == "0" {
                outputTF.text = "Divide by Zero"
            }
            else {
                result = Results(input: Int(inputTF.text!)!, input2: Int(input2TF.text!)!, type: type)
            }
        }
    }
    
    
    fileprivate var result: Results = Results(input: 0, input2: 0, type: .none) {
        didSet{
            outputTF.text = String(result.output)
        }
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

