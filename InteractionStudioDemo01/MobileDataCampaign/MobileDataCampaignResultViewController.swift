//
//  MobileDataCampaignResultViewController.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/13.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

class MobileDataCampaignResultViewController: UIViewController {
    
    @IBOutlet weak var astroImage: UIImageView!
    @IBOutlet weak var campaignNameLabel: UILabel!
    @IBOutlet weak var campaignInfoTextView: UITextView!
    @IBOutlet weak var jsonTitleLabel: UILabel!
    @IBOutlet weak var jsonTextView: UITextView!
    @IBOutlet weak var clickthroughButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var activeCampaign:EVGCampaign!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Note self is captured weakly
        let handler = { [weak self] (campaign: EVGCampaign) -> Void in
            // Safest to perform a single method/operation on weakSelf, which will simply be a no-op if weakSelf is nil:
            self?.handleCampaign(campaign: campaign)
        }
        // The target string uniquely identifies the expected data schema - here, a featured product:
        evergageScreen?.setCampaignHandler(handler, forTarget: delegate.mobileDataCampaignTarget!)
        evergageScreen?.trackAction(delegate.mobileDataCampaignAction!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.SFDCGrey()
        astroImage.image = UIImage(named: "astro01")
        campaignNameLabel.textColor = UIColor.SFDCBlue()
        jsonTitleLabel.textColor = UIColor.SFDCBlue()
        jsonTextView.defaultTextViewStyle()
        clickthroughButton.defaultButtonStyle()
        dismissButton.dismissButtonStyle()
    }
    
    func handleCampaign(campaign: EVGCampaign) {
        
        campaignNameLabel.text = campaign.campaignName
        campaignInfoTextView.text = ("[CampaignId] \(campaign.campaignId)\n")
        campaignInfoTextView.text.append("[CampaignName] \(campaign.campaignName)\n")
        campaignInfoTextView.text.append("[ExperienceId] \(campaign.experienceId)\n")
        campaignInfoTextView.text.append("[ExperienceName] \(campaign.experienceName)")
        jsonTextView.text = String(describing: campaign.data)
        print(campaign.data)
        // Track the impression for statistics even if the user is in the control group.
        evergageScreen?.trackImpression(campaign)
        
        // Only display the campaign if the user is not in the control group.
        if (!campaign.isControlGroup) {
            // Keep active campaign as long as needed for (re)display and comparison
            activeCampaign = campaign
        }
    }
    
    @IBAction func tapClickthroughButton(_ sender: Any) {
        evergageScreen?.trackClickthrough(activeCampaign)
    }
    
    @IBAction func tapDisimissButton(_ sender: Any) {
        evergageScreen?.trackDismissal(activeCampaign)
    }
}
