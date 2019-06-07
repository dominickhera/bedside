//
//  FloatExtension.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation

extension Float {
    mutating func convertKelvinToCelsius() -> Float {
        let tempValue = self - 273.15
        return (Darwin.round(tempValue))
    }
    
    func convertKelvinToFahrenheit() -> Float {
        let celsius = self - 273.15
        let tempF = celsius * (9/5)
        return (tempF + 32)
    }
}
