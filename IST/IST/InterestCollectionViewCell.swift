//
//  InterestCollectionViewCell.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/29/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    
    var interest: Interest! {
        didSet {
            self.updateUI()
        }
    }
    private func updateUI() {
        if let interest = interest {
            featuredImageView.image = interest.featuredImage
            
        }else{
            featuredImageView.image = interest.featuredImage
        }
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
    
}
