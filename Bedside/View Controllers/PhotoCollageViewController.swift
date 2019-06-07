//
//  PhotoCollageViewController.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit
import CoreLocation

class PhotoCollageViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var timer:Timer!
    var weatherTimer: Timer!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        timeLabel.addBackShadow()
//        cityNameLabel.addBackShadow()
//        temperatureLabel.addBackShadow()
        enableBasicLocationServices()
        timeView.roundCorners()
//        timeLabel.layer.shadowColor = UIColor.black.cgColor
////        timeLabel.layer.shadowRadius = 3.0
//        timeLabel.layer.shadowOpacity = 1.0
//        timeLabel.layer.shadowOffset = CGSize(width: 3, height: 1)
//        timeLabel.layer.masksToBounds = false
//        timeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(segueToPhotoView)))
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(segueToPhotoView)))
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(unwindToDarkView))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
//        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = DataManager.shared.getCurrentTime()
        
        if (timer != nil) {
            timer.invalidate()
        }
        
        if (weatherTimer != nil) {
            weatherTimer.invalidate()
        }
        timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
        
        weatherTimer = Timer.init(timeInterval: 15, target: self, selector: #selector(updateWeather), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = DataManager.shared.getCurrentTime()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer?.invalidate()
        timer = nil
    }
    
//    @objc func segueToPhotoView() {
//        print("touch")
//        self.performSegue(withIdentifier: "segueToPhotoView", sender: Any?.self)
//    }
    
    @objc func updateWeather() {
        var currentLocation: CLLocation!
        currentLocation = locationManager.location
        WeatherManager.shared.getCurrentWeather(longitude: "\(currentLocation.coordinate.longitude)", lattitude: "\(currentLocation.coordinate.latitude)") { (error) in
            self.cityNameLabel.text = WeatherManager.shared.weather.cityName
            self.temperatureLabel.text = "\((WeatherManager.shared.weather.temperatureKelvin?.convertKelvinToCelsius())!) °C"
        }
    }
    @objc func unwindToDarkView() {
        dismiss(animated: true, completion: nil)
    }
    @objc func updateTime() {
        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = tempTime
    }
    
    func enableBasicLocationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            print("bad")
//            disableMyLocationBasedFeatures()
            break
            
        case .authorizedWhenInUse, .authorizedAlways:
            // Enable location features
            print("gucci")
            var currentLocation: CLLocation!
            currentLocation = locationManager.location
            WeatherManager.shared.getCurrentWeather(longitude: "\(currentLocation.coordinate.longitude)", lattitude: "\(currentLocation.coordinate.latitude)") { (error) in
                DispatchQueue.main.async {
                    self.cityNameLabel.text = WeatherManager.shared.weather.cityName
                    self.temperatureLabel.text = "\((WeatherManager.shared.weather.temperatureKelvin?.convertKelvinToCelsius())!) °C"
                }
            }
//            enableMyWhenInUseFeatures()
            break
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
