//
//  LabelExtension.swift
//  Bedside
//
//  Created by Dominick Hera on 6/7/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit

extension UILabel {
    func addBackShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 3, height: 1)
        self.layer.masksToBounds = false
    }
}
