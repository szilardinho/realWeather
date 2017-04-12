//
//  Constants.swift
//  realWeather
//
//  Created by Szi Gabor on 4/12/17.
//  Copyright © 2017 Szi. All rights reserved.
//

import Foundation


let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "b1b15e88fa797225412429c1c50c122a1"


let currentWeatherURL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY))"

