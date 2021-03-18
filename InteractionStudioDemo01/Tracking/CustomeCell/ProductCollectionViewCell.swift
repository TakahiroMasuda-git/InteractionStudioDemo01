//
//  ProductCollectionViewCell.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/14.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
