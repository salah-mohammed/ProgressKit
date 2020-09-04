//
//  ProgressCollectionViewCell.swift
//  ProgressKitExample
//
//  Created by Salah on 9/4/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import ProgressKit
class ProgressCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCircleProgress:CircleProgress!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ object:ProgressITem){
        self.viewCircleProgress.fullTrackColor=object.fullTrackColor ?? UIColor.clear
        self.viewCircleProgress.partialTrackColor=object.partialTrackColor ?? UIColor.clear
        self.viewCircleProgress.fullTrackWidth=object.fullTrackWidth ?? 0
        self.viewCircleProgress.partialTrackWidth=object.partialTrackWidth ?? 0
        self.viewCircleProgress.angle=object.angle ?? .full
        
        self.viewCircleProgress.fullTrackShapeLayerLineCap=object.trackShape
        self.viewCircleProgress.partialTrackShapeLayerLineCap=object.trackShape 

        
        self.viewCircleProgress.durationValue=object.durationValue
        self.viewCircleProgress.value=object.value ?? 0
    }
}
