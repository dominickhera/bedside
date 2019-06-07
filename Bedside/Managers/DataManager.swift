//
//  dataManager.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        var returnMinuteString = "\(minutes)"
        
        if (minutes < 10) {
            returnMinuteString = "0\(minutes)"
        }
        
        return ("\(hour):\(returnMinuteString)")
    }
}
