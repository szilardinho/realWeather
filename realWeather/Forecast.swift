//
//  Forecast.swift
//  realWeather
//
//  Created by Szi Gabor on 4/21/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import Foundation
import UIKit

import Alamofire

extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        
    }
}


class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!

    var forecasts = [Forecast]()

var date : String {
    
    if _date == nil {
        _date = ""
    }
    return _date
}
    
    var weatherType : String {
        
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp : String {
        
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp : String {
        
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDictionary: Dictionary<String, AnyObject>){
        
        if let temp = weatherDictionary["temp"] as? Dictionary<String, AnyObject>{
            
            if let min = temp["min"] as? Double{
                
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._lowTemp = String(kelvinToFarenheit)
                }
            
            if let max = temp["max"] as? Double{
                
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = String(kelvinToFarenheit)

                }
            }
        
        if let weather = weatherDictionary["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDictionary["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
        }
    
    
    
  
    func downloadForecastData(completed:@escaping DownloadComplete){
        //Downloading forecasr weather data for tableview
        
        let forecastURL = URL(string:FORECAST_URL)
        
        Alamofire.request(forecastURL!,method: HTTPMethod.get).responseJSON{ response in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, AnyObject?>{
                
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject?>]{
                    
                    for object in list {
                        
                        let forecast = Forecast(weatherDictionary: object as Dictionary<String, AnyObject>)
                        self.forecasts.append(forecast)
                        print(object)
                    }
                    
                }
            }
            completed()
        }
    }
    
    
    
    
    
    


}
