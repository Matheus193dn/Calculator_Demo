//
//  WeatherGetter.swift
//  WeatherAPI
//
//  Created by Minh Hoang Nguyen on 05/08/17.
//  Copyright © 2017 Minh Hoang Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherGetter {
    
    private let stringurl = "http://api.openweathermap.org/data/2.5/weather?q="
    private let appId = "&appid=7d16e1593f93f4d8115b0259222fb6ee"
    
    func getWeather(city: String) {
        
        let str = "\(stringurl)"+"\(city)"+"\(appId)"
        let inputURL = URL(string: str)
        
        Alamofire.request(inputURL!, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                //print(json)
                
                for (key,subJson):(String, JSON) in json["main"] {
                    if (key == "temp_min" || key == "temp_max" || key == "temp") {
                        myDictionary[key] = String(describing: subJson)
                    }
                }
                
                myDictionary["main"] = String(describing: json["weather"][0]["main"])
                myDictionary["description"] = String(describing: json["weather"][0]["description"])
                myDictionary["icon"] = String(describing: json["weather"][0]["icon"])
                
                myDictionary["name"] = String(describing: json["name"])
                
                //let defaults = UserDefaults.standard
                //defaults.set(myDictionary, forKey: "data")
                //defaults.synchronize()
             
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
