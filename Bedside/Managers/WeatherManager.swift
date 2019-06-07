//
//  WeatherManager.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherManager {
    static let shared = WeatherManager()
    var weather = CurrentWeather.shared()
    private init() {}
 
    func getCurrentWeather(longitude: String, lattitude: String, callback: @escaping(_ error: Error?) -> Void ) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lattitude)&lon=\(longitude)&appid=b8ae01f6344f6fb00b128c10e4ffcf19"
        Alamofire.request(url, method: .get,encoding: URLEncoding.httpBody)
            .responseJSON { response in
                response.result.ifSuccess {
//                    print(response.value)
                    let ResponseList = JSON(response.value!)
//                    print(ResponseList["main"])
                    let main = ResponseList["main"]
                    print(main["pressure"])
                    self.weather.pressure = main["pressure"].int
                    self.weather.humidity = main["humidity"].int
                    self.weather.temperatureKelvin = main["temp"].float
                    self.weather.temperatureKelvinMax = main["temp_max"].float
                    self.weather.temperatureKelvinMin = main["temp_min"].float
                    
                    let tempWeather = ResponseList["weather"]
                    self.weather.weatherDescription = tempWeather["description"].string
                    self.weather.weatherDescriptionMain = tempWeather["main"].string
                    self.weather.cityName = ResponseList["name"].string
//                    if let ResponseList = response.value as? NSArray {
//                    for item in ResponseList {
//                        let tempDescription = "\(((item as AnyObject).value(forKey: "description"))!)"
//                        let tempAmount = "\(((item as AnyObject).value(forKey: "amount"))!)"
//                        let tempDate = "\(((item as AnyObject).value(forKey: "date"))!)"
//
//                    print(ResponseList["main"].stringValue)
//                        print("\n\n")
////                        let newTransaction = Transaction(description: tempDescription, amount: tempAmount, date: tempDate)
////                        self.tranactionList.append(newTransaction)
//                    }
//                    }
//                   print(self.weather.pressure)
//                   print(self.weather.temperatureKelvinMin)
                }
                callback(nil)
        }
    }
    
}
