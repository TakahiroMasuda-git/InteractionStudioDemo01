//
//  UIView+Extension.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/19.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

extension UIView {
    func addBackground(name: String) {

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: name)
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
}
