//
//  MobileTrackingViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/14.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class MobileTrackingViewController: UIViewController {
    
    @IBOutlet weak var actionTrackingTextField: UITextField!
    @IBOutlet weak var submitActionButton: UIButton!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var actionTrackingText:String?
    let products = Products()
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "background")
        submitActionButton.disabledButtonStyle()

        //productsCollectionView
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: .main)
        productsCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    @IBAction func checkActionTracking(_ sender: UITextField) {
        actionTrackingText = sender.text
        validate()
    }
    
    @IBAction func tapSubmitActionButton(_ sender: Any) {
        evergageScreen?.trackAction(actionTrackingTextField.text!)
        actionTrackingTextField.text = nil
    }
    
    func validate() {
        guard let checkActionTrackingText = actionTrackingText else {
            submitActionButton.disabledButtonStyle()
            return
        }
        if checkActionTrackingText.count == 0 {
            submitActionButton.disabledButtonStyle()
            return
        }
        submitActionButton.defaultButtonStyle()
    }
}

extension MobileTrackingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.productIds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        let product = products.getProduct(targetIndex: indexPath.row)
        cell.backgroundColor = UIColor.SFDCGrey()
        cell.productNameLabel.textColor = UIColor.lightGray
        cell.productNameLabel.text = product["name"] as? String
        cell.productPriceLabel.textColor = UIColor.SFDCBlue()
        cell.productPriceLabel.text = "¥ \(String(product["price"] as! Int))"
        cell.productImage.image = UIImage(named: product["id"] as! String)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:0,left:10,bottom:0,right:-10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.itemActionSelectedProductIndex = indexPath.row
        performSegue(withIdentifier: "showProductDetailVC", sender: nil)
    }

}
