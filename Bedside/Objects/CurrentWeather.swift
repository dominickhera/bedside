//
//  CurrentWeather.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeather {
    private static var sharedInstance: CurrentWeather? = CurrentWeather()
    var cityName: String?
    var temperatureKelvin: Float?
    var temperatureKelvinMax: Float?
    var temperatureKelvinMin: Float?
    var pressure: Int?
    var humidity: Int?
    var weatherDescription: String?
    var weatherDescriptionMain: String?
    
    private init() {}
    
    class func shared() -> CurrentWeather {
        guard let currentWeather = sharedInstance else {
            sharedInstance = CurrentWeather()
            return sharedInstance!
        }
        return currentWeather
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}
