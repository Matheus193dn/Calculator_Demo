//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Minh Hoang Nguyen on 05/08/17.
//  Copyright © 2017 Minh Hoang Nguyen. All rights reserved.
//

import UIKit
import SDWebImage

var myDictionary:[String: String] = [:]

class ViewController: UIViewController {    
    
    let weather = WeatherGetter()
    @IBOutlet weak var input: UITextField!
    @IBAction func search(_ sender: UIButton) {
        
        if let city = input.text{
            weather.getWeather(city: city)
        }
        
        print(myDictionary)
        //cityLabel.text = myDictionary[""]
        tempLabel.text = "Temperature: " + (myDictionary["temp"] ?? "") + "ºF"
        tempminLabel.text = "Temperature min: " + (myDictionary["temp_min"] ?? "") + "ºF"
        tempmaxLabel.text = "Temperature max: " + (myDictionary["temp_max"] ?? "") + "ºF"
        weathermainLabel.text = "Weather: " + (myDictionary["main"] ?? "")
        weatherdesc.text = "Description: " + (myDictionary["description"] ?? "")
        let icon = myDictionary["icon"] ?? ""
        let imageURL: URL? = URL(string: "http://openweathermap.org/img/w/\(icon).png")
        
        if let url = imageURL {
            weathericon.sd_setImage(with: url)
        }
        
    }
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempminLabel: UILabel!
    @IBOutlet weak var tempmaxLabel: UILabel!
    @IBOutlet weak var weathermainLabel: UILabel!
    @IBOutlet weak var weatherdesc: UILabel!
    @IBOutlet weak var weathericon: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateData(){
        
        //let weather = WeatherGetter()
        
        //weather.getWeather(city: city)
    }


}

