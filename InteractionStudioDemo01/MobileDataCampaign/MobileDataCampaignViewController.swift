//
//  MobileDataCampaignViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/13.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class MobileDataCampaignViewController: UIViewController {
    
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var sendEventButton: UIButton!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var targetText:String?
    var actionText:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addBackground(name: "background")
        sendEventButton.disabledButtonStyle()
    }
    
    @IBAction func checkTargetText(_ sender: UITextField) {
        targetText = sender.text
        validate()
    }
    
    @IBAction func checkActionText(_ sender: UITextField) {
        actionText = sender.text
        validate()
    }
    
    @IBAction func tapSendEventButton(_ sender: Any) {
        delegate.mobileDataCampaignTarget = targetTextField.text!
        delegate.mobileDataCampaignAction = actionTextField.text!
        performSegue(withIdentifier: "showMobileDataCampaignResultVC", sender: nil)
    }
    
    func validate() {
        guard let checkTargetText = targetText,
              let checkActionText = actionText else {
            sendEventButton.disabledButtonStyle()
            return
        }
        if checkTargetText.count == 0 || checkActionText.count == 0{
            sendEventButton.disabledButtonStyle()
            return
        }
        sendEventButton.defaultButtonStyle()
    }
}
