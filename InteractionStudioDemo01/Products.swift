//
//  Products.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/14.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import Foundation

struct Products {
    let productIds: [String] = ["product01","product02","product03","product04","product05"]
    
    let productsName: [String:String] = [
        "product01":"Sample Product-01",
        "product02":"Sample Product-02",
        "product03":"Sample Product-03",
        "product04":"Sample Product-04",
        "product05":"Sample Product-05"
    ]
    
    let productsCategory: [String:String] = [
        "product01":"Outer Jacket",
        "product02":"Swet Shirts",
        "product03":"Outer Jacket",
        "product04":"Shoes",
        "product05":"Outer Jacket"
    ]
    
    let productsPrice: [String:Int] = [
        "product01":10000,
        "product02":15000,
        "product03":20000,
        "product04":35000,
        "product05":17000
    ]
    
    func getProduct(targetIndex: Int)->[String:Any]{
        let target: String = self.productIds[targetIndex]
        let Product: [String:Any] = [
            "id": self.productIds[targetIndex] as Any,
            "name": self.productsName[target] as Any,
            "category": self.productsCategory[target] as Any,
            "price": self.productsPrice[target] as Any
            ]
        return Product;
    }
}
