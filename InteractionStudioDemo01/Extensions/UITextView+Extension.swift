//
//  UITextView+Extension.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/19.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

extension UITextView{
    func defaultTextViewStyle() {
        self.layer.borderWidth = 0.1
        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
    }
    
}
