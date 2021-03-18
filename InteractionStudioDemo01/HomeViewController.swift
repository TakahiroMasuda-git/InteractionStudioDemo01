//
//  HomeViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/10.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class HomeViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var mobileDataButton: UIButton!
    @IBOutlet weak var mobileTrackingButton: UIButton!
    @IBOutlet weak var DataCaptureButton: UIButton!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var loginText:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "background")
        logoImage.image = UIImage(named: "logo")
        
        if(delegate.userId.isNotEmpty()){
            userIdLabel.text = delegate.userId
            loginTextField.isHidden = true
            loginButton.isHidden = true
            userIdLabel.isHidden = false
            mobileDataButton.defaultButtonStyle()
            mobileTrackingButton.defaultButtonStyle()
            DataCaptureButton.defaultButtonStyle()
        }else{
            loginButton.disabledButtonStyle()
            mobileDataButton.disabledButtonStyle()
            mobileTrackingButton.disabledButtonStyle()
            DataCaptureButton.disabledButtonStyle()
        }
    }
    
    @IBAction func loginTextFieldEdit(_ sender: UITextField) {
        loginText = sender.text
        validate()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        delegate.userId = loginTextField.text
        delegate.evergage.userId = delegate.userId
        evergageScreen?.trackAction("Login")
        userIdLabel.text = delegate.userId
        loginTextField.isHidden = true
        loginButton.isHidden = true
        userIdLabel.isHidden = false
        mobileDataButton.defaultButtonStyle()
        mobileTrackingButton.defaultButtonStyle()
        DataCaptureButton.defaultButtonStyle()
    }
    
    @IBAction func tapMobileDataButton(_ sender: Any) {
        performSegue(withIdentifier: "pushMobileDataCampaignVC", sender: nil)
    }

    @IBAction func tapMobileTrackingButton(_ sender: Any) {
        performSegue(withIdentifier: "pushMobileTrackingVC", sender: nil)
    }
    
    @IBAction func tapDataCaptureButton(_ sender: Any) {
        performSegue(withIdentifier: "pushDataCaptureVC", sender: nil)
    }
    
    func validate() {
        guard let checkLoginText = loginText else {
            loginButton.disabledButtonStyle()
            return
        }
        if checkLoginText.count == 0 {
            loginButton.disabledButtonStyle()
            return
        }
        loginButton.defaultButtonStyle()
    }

}

