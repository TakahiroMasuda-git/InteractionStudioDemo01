//
//  DataCaptureViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/15.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class DataCaptureViewController: UIViewController {
    
    
    @IBOutlet weak var attributesKeyTextField: UITextField!
    @IBOutlet weak var attributesValueTextField: UITextField!
    @IBOutlet weak var submitUserAttributesButton: UIButton!
    @IBOutlet weak var productIdTextField: UITextField!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var submitProductButton: UIButton!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var attributesKeyText:String?
    var attributesValueText:String?
    var productIdText:String?
    var productNameText:String?
    var priceText:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "background")
        submitUserAttributesButton.disabledButtonStyle()
        submitProductButton.disabledButtonStyle()
    }
    
    @IBAction func checkAttributesKey(_ sender: UITextField) {
        attributesKeyText = sender.text
        validateUserAttributes()
    }
    
    @IBAction func checkAttributesValue(_ sender: UITextField) {
        attributesValueText = sender.text
        validateUserAttributes()
    }
    
    @IBAction func checkProductId(_ sender: UITextField) {
        productIdText = sender.text
        validateProducts()
    }
    
    @IBAction func checkProductName(_ sender: UITextField) {
        productNameText = sender.text
        validateProducts()
    }
    
    @IBAction func checkPrice(_ sender: UITextField) {
        priceText = sender.text
        validateProducts()
    }
    
    @IBAction func tapSubmitUserAttributesButton(_ sender: Any) {
        let attributesKey:String = attributesKeyTextField.text!
        let attributesValue:String = attributesValueTextField.text!
        delegate.evergage.setUserAttribute(attributesValue, forName: attributesKey)
        evergageScreen?.trackAction("set user attributes")
        
        attributesKeyTextField.text = nil
        attributesValueTextField.text = nil
    }
    
    @IBAction func tapSubmitProductButton(_ sender: Any) {
        //"General Setup > Process Item Data from Native Mobile Apps" must be enabled
        //let price = Int(priceTextField.text ?? "0")
        let price  = (Int(priceTextField.text!) != nil) ? Int(priceTextField.text!) : 0
        let evgProduct = EVGProduct.init(
            id: productIdTextField.text!,
            name: productNameTextField.text!,
            price: price as NSNumber?,
            url: nil,
            imageUrl: nil,
            evgDescription: nil)
        evergageScreen?.viewItem(evgProduct)
        productIdTextField.text = nil
        productNameTextField.text = nil
        priceTextField.text = nil
    }
    
    func validateUserAttributes() {
        guard let checkAttributesKeyText = attributesKeyText,
              let checkAttributesValueText = attributesValueText else {
            submitUserAttributesButton.disabledButtonStyle()
            return
        }
        if checkAttributesKeyText.count == 0 || checkAttributesValueText.count == 0{
            submitUserAttributesButton.disabledButtonStyle()
            return
        }
        submitUserAttributesButton.defaultButtonStyle()
    }
    
    func validateProducts() {
        guard let checkProductIdText = productIdText,
              let checkProductNameText = productNameText,
              let checkPriceText = priceText else {
            submitProductButton.disabledButtonStyle()
            return
        }
        if checkProductIdText.count == 0 || checkProductNameText.count == 0 ||
            checkPriceText.count == 0{
            submitProductButton.disabledButtonStyle()
            return
        }
        submitProductButton.defaultButtonStyle()
    }
    
}

