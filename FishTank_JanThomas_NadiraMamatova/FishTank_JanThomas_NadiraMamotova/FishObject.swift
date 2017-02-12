//
//  FishObject.swift
//  FishTank_JanThomas_NadiraMamatova
//
//  Created by Jan on 2/10/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class FishObject: NSObject {
    
    var iImageView : UIImageView?
    var aDly = 0.0
    var aDur = 0.0
    var iImage = UIImage(named: "")
    
    init( iImageView: UIImageView?, aDly: Double, aDur: Double, iImage: UIImage)
    {
        self.iImageView = iImageView
        self.aDly = aDly
        self.aDur = aDur
        self.iImage = iImage
        
    }

}
