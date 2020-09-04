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
    var value:TimeInterval?
     init(        fullTrackColor:UIColor,
                  partialTrackColor:UIColor,
                  fullTrackWidth:CGFloat,
                  partialTrackWidth:CGFloat,
                  angle:CircleProgress.Angle,
                  value:TimeInterval) {
        super.init();
        self.fullTrackColor=fullTrackColor
        self.partialTrackColor=partialTrackColor
        self.fullTrackWidth=fullTrackWidth
        self.partialTrackWidth=partialTrackWidth
        self.angle=angle
        self.value=value;
    }
    
    convenience init(  _ fullTrackColor:UIColor,
                       _ partialTrackColor:UIColor,
                       _ trackWidth:CGFloat,
                       _ angle:CircleProgress.Angle,
                       _ value:TimeInterval) {
        self.init(fullTrackColor: fullTrackColor, partialTrackColor: partialTrackColor, fullTrackWidth: trackWidth, partialTrackWidth: trackWidth, angle: angle, value: value)
    }
}
class ViewController: UIViewController {
    var dataSet:[ProgressITem]{
        return [ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterTopSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterBottomSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterLeftSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterRightSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterTopRightSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterTopLeftSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterBottomRightSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.threeQuarterBottomLeftSpace,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.topRightQuarter,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.topLeftQuarter,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.bottomRightQuarter,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.bottomLeftQuarter,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.full,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.rightHalf,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.leftHalf,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.topHalf,50),
                ProgressITem.init(UIColor.lightGray,UIColor.red,5,.bottomHalf,50),

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
        return CGSize.init(width: UIScreen.main.bounds.width-10, height: 100);
    }
}
