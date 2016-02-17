//
//  BackgroundImage.swift
//  PoxeInfo
//
//  Created by Aya on 2/17/16.
//  Copyright © 2016 Aya. All rights reserved.
//

import UIKit

class BackgroundImage: UIImageView
{
    
    override func awakeFromNib()
    {
        self.image = UIImage( named: "bg")
        self.contentMode = UIViewContentMode.ScaleAspectFill
        
    }
   
}
