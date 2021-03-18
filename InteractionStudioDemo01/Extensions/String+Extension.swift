//
//  String+Extension.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/19.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

extension Optional where Wrapped == String {
    func isEmpty()->Bool {
        guard let str = self else {
            return true
        }
        return str.isEmpty
    }

    func isNotEmpty()-> Bool {
        guard let str = self else {
            return false
        }
        return !str.isEmpty
    }
}
