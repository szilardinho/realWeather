//
//  CurrentWeather.swift
//  realWeather
//
//  Created by Szi Gabor on 4/12/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import Foundation
import Alamofire

class currentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemperature:Double!
    
    
    var cityName: String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil{
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        
        return _date
    }
    
 
    
    
    
}
