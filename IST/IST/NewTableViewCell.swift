//
//  NewTableViewCell.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/27/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
