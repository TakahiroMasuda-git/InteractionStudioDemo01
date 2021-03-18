//
//  UIColor+Extension.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/19.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

extension UIColor{
    class func SFDCBlue()->UIColor{
        let rgb = UIColor.init(red: 10/255, green: 154/255, blue: 215/255, alpha: 1)
        return rgb
    }
    
    class func SFDCGrey()->UIColor{
        let rgb = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return rgb
    }
}
