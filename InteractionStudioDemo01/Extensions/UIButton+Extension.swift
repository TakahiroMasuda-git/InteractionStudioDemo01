//
//  UIButton+Extension.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/19.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

extension UIButton{
    func defaultButtonStyle() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.SFDCBlue()
        self.setTitleColor(UIColor.white, for: .normal)
        self.isEnabled = true
    }
    
    func dismissButtonStyle() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.lightGray
        self.setTitleColor(UIColor.white, for: .normal)
        self.isEnabled = true
    }
    
    func disabledButtonStyle() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.lightGray
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.isEnabled = false
    }
    
}
