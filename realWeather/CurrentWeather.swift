//
//  CurrentWeather.swift
//  realWeather
//
//  Created by Szi Gabor on 4/12/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
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
    
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        
        //Alamofire Downlaod
        
        let currentWeatherURL = URL(string:  CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!,method: HTTPMethod.get).responseJSON{ response in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, AnyObject?>{
                
                if let name = dictionary["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dictionary["weather"] as? [Dictionary<String,AnyObject?>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                    
                }
                
                
                if let main = dictionary["main"] as? Dictionary<String, AnyObject?>{
                    
                    if let currentTemperature = main["temp"] as? Double{
                        
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemperature = kelvinToFarenheit
                        
                        print(self._currentTemperature)
                        
                    }
                }
            }            
            
            completed()
        }
        
    }
    
    
}
