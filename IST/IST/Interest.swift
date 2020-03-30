//
//  Interest.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/29/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class Interest
{
    var featuredImage: UIImage
    
    init(featuredImage: UIImage)
    {
        self.featuredImage = featuredImage
    }
    
    static func fetchInterests() -> [Interest]
    {
        return [
            Interest(featuredImage: #imageLiteral(resourceName: "video2")),
            Interest(featuredImage: #imageLiteral(resourceName: "video1"))
        ]
    }
}
