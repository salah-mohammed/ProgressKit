//
//  ViewController.swift
//  ProgressKitExample
//
//  Created by Salah on 5/4/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import ProgressKit

class ProgressITem:NSObject{
    var fullTrackColor:UIColor?
    var partialTrackColor:UIColor?
    var fullTrackWidth:CGFloat?
    var partialTrackWidth:CGFloat?
    var angle:CircleProgress.Angle?
    var durationValue:TimeInterval=100;
    var trackShape:CAShapeLayerLineCap = .round
    var value:TimeInterval?
     init(        fullTrackColor:UIColor,
                  partialTrackColor:UIColor,
                  fullTrackWidth:CGFloat,
                  partialTrackWidth:CGFloat,
                  angle:CircleProgress.Angle,
                  trackShape:CAShapeLayerLineCap,
                  value:TimeInterval) {
        super.init();
        self.fullTrackColor=fullTrackColor
        self.partialTrackColor=partialTrackColor
        self.fullTrackWidth=fullTrackWidth
        self.partialTrackWidth=partialTrackWidth
        self.angle=angle
        self.trackShape=trackShape;
        self.value=value;
    }
    
    convenience init(  _ fullTrackColor:UIColor,
                       _ partialTrackColor:UIColor,
                       _ trackWidth:CGFloat,
                       _ angle:CircleProgress.Angle,
                       _ trackShape:CAShapeLayerLineCap,
                       _ value:TimeInterval) {
        self.init(fullTrackColor: fullTrackColor, partialTrackColor: partialTrackColor, fullTrackWidth: trackWidth, partialTrackWidth: trackWidth, angle: angle, trackShape: trackShape, value: value)
    }
}
class ViewController: UIViewController {
    var dataSet:[ProgressITem]{
        return [ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterTopSpace,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterBottomSpace,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterLeftSpace,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterRightSpace,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterTopRightSpace,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterTopLeftSpace,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterBottomRightSpace,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.threeQuarterBottomLeftSpace,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.topRightQuarter,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.topLeftQuarter,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.bottomRightQuarter,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.bottomLeftQuarter,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.full,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.rightHalf,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.leftHalf,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.topHalf,.square,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.bottomHalf,.round,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,13,.custom(value:CircleProgress.ProgressAngleValue.init(startAngle:0, endAngle:CircleProgress.QuarterValue)),.round,50),

        ];
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items:[ProgressITem]=[ProgressITem]();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate=self;
        self.collectionView.dataSource=self;
        self.items=self.dataSet;
        self.collectionView.reloadData();
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProgressCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"ProgressCollectionViewCell", for: indexPath) as! ProgressCollectionViewCell
        cell.config(self.items[indexPath.row]);
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (UIScreen.main.bounds.width/2)-10, height: 100);
    }
}
