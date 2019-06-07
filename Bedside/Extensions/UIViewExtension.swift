//
//  UIViewExtension.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.init(width: 1, height: 1)
        self.layer.shadowOpacity = 0.16
    }
}
