//
//  NightClockViewController.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit

class NightClockViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
//        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
//        self.view.addGestureRecognizer(swipeDown)
//
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(segueToPhotoView))
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeLeft)
        timeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(segueToPhotoView)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(segueToPhotoView)))

        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(segueToPhotoView))
        edgePan.edges = .right
        
        view.addGestureRecognizer(edgePan)
//        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = DataManager.shared.getCurrentTime()
        
        if (timer != nil) {
            timer.invalidate()
        }
        timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = DataManager.shared.getCurrentTime()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer?.invalidate()
        timer = nil
    }
    
    @objc func segueToPhotoView() {
        print("touch")
        self.performSegue(withIdentifier: "segueToPhotoView", sender: Any?.self)
    }
    
    @objc func updateTime() {
        let tempTime = DataManager.shared.getCurrentTime()
        timeLabel.text = tempTime
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
