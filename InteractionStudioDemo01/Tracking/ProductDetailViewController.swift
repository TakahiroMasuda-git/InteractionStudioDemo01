//
//  ProductDetailViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/14.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class ProductDetailViewController: UIViewController {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    @IBOutlet weak var viewItemButton: UIButton!
    @IBOutlet weak var viewCategoryButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var purchaseButton: UIButton!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let products = Products()
    var product:Dictionary<String, Any>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product = products.getProduct(targetIndex: delegate.itemActionSelectedProductIndex!)
        
        productImage.image = UIImage(named: product["id"] as! String)
        productCategoryLabel.text = product["category"] as? String
        productCategoryLabel.textColor = UIColor.SFDCBlue()
        productNameLabel.text = product["name"] as? String
        productPriceLabel.textColor = UIColor.SFDCBlue()
        productPriceLabel.text = "¥ \(String(product["price"] as! Int))"
        viewItemButton.defaultButtonStyle()
        viewCategoryButton.defaultButtonStyle()
        addToCartButton.defaultButtonStyle()
        purchaseButton.defaultButtonStyle()
    }
    
    @IBAction func tapViewItemButton(_ sender: Any) {
        //"General Setup > Process Item Data from Native Mobile Apps" must be enabled
        let evgProduct = EVGProduct.init(
            id: product["id"] as! String,
            name: product["name"] as? String,
            price: product["price"] as? NSNumber,
            url: nil,
            imageUrl: nil,
            evgDescription: nil)
        evergageScreen?.viewItem(evgProduct)
    }
    
    @IBAction func tapViewCategoryButton(_ sender: Any) {
        let evgCategory = EVGCategory.init(
            id: product["category"] as! String,
            isDepartment: false,
            name: product["category"] as? String,
            evgDescription: nil)
        evergageScreen?.viewCategory(evgCategory)
    }
    
    @IBAction func tapAddToCartButton(_ sender: Any) {
        let evgLineItem = EVGLineItem.init(
            productId: product["id"] as! String,
            productName: product["name"] as? String,
            price: product["price"] as? NSNumber,
            quantity: 1)
        evergageScreen?.add(toCart: evgLineItem)
    }
    
    @IBAction func tapPurchaseButton(_ sender: Any) {
        let date: Date = Date()
        let unixtime:Int = Int(date.timeIntervalSince1970)
        let unixtimeString:String = String(unixtime)
        
        let evgLineItem = EVGLineItem.init(
            productId: product["id"] as! String,
            productName: product["name"] as? String,
            price: product["price"] as? NSNumber,
            quantity: 1)
        
        let evgOrder = EVGOrder.init(
            id: unixtimeString,
            lineItems: [evgLineItem],
            totalValue: product["price"] as? NSNumber)
        evergageScreen?.purchase(evgOrder)
    }
    
    
}

