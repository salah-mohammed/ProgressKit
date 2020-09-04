//
//  CircleProgress.swift
//
//  Created by Salah Mohamed on 4/3/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit
// QuarterValue quarter
// (CGFloat.pi) half
// start angle start from bottom left to end angle value
open class CircleProgress: UIView {
    public static var  QuarterValue:CGFloat=(CGFloat.pi/2);
    public static var  HalfQuarterValue:CGFloat=(QuarterValue/2);
    public static var  HalfValue:CGFloat=CGFloat.pi
    public static var  FullValue:CGFloat=2*CGFloat.pi
    private static var animationDuration:TimeInterval = 1;
    private static var clockwise:Bool = true;
    
    public struct ProgressAngleValue{
        var startAngle:CGFloat=0
        var endAngle:CGFloat=0
       public init(startAngle:CGFloat,endAngle:CGFloat) {
            self.startAngle=startAngle;
            self.endAngle=endAngle;
        }
    }
    public enum Angle {
        case threeQuarterTopSpace
        case threeQuarterBottomSpace
        case threeQuarterLeftSpace
        case threeQuarterRightSpace
        
        case threeQuarterTopRightSpace
        case threeQuarterTopLeftSpace
        case threeQuarterBottomRightSpace
        case threeQuarterBottomLeftSpace
        
        case topRightQuarter
        case topLeftQuarter
        case bottomRightQuarter
        case bottomLeftQuarter
        case full
        case rightHalf
        case leftHalf
        case topHalf
        case bottomHalf
        case custom(value:ProgressAngleValue)
        
        var progressAngleValue:ProgressAngleValue{
            switch self {
            case .threeQuarterTopSpace:
                return ProgressAngleValue.init(startAngle:-HalfQuarterValue, endAngle:HalfValue+HalfQuarterValue)
            case .threeQuarterBottomSpace:
                return ProgressAngleValue.init(startAngle:-HalfValue-HalfQuarterValue, endAngle:HalfQuarterValue)
            case .threeQuarterLeftSpace:
                return ProgressAngleValue.init(startAngle:-HalfQuarterValue-QuarterValue, endAngle:HalfQuarterValue+QuarterValue)
            case .threeQuarterRightSpace:
                return ProgressAngleValue.init(startAngle:HalfQuarterValue, endAngle:-HalfQuarterValue)
            case .threeQuarterBottomLeftSpace:
                return ProgressAngleValue.init(startAngle:-HalfValue, endAngle:QuarterValue)
            case .threeQuarterBottomRightSpace:
                return ProgressAngleValue.init(startAngle:-HalfValue - QuarterValue, endAngle:0)
            case .threeQuarterTopLeftSpace:
                return ProgressAngleValue.init(startAngle:-QuarterValue, endAngle:HalfValue)
            case .threeQuarterTopRightSpace:
                return ProgressAngleValue.init(startAngle:0, endAngle:HalfValue + QuarterValue)
            case .bottomLeftQuarter:
                return ProgressAngleValue.init(startAngle:QuarterValue, endAngle:HalfValue)
            case .topLeftQuarter:
                return ProgressAngleValue.init(startAngle: -HalfValue, endAngle:-QuarterValue)
            case .bottomRightQuarter:
                return ProgressAngleValue.init(startAngle:0, endAngle:-QuarterValue)
            case .topRightQuarter:
                return ProgressAngleValue.init(startAngle:0, endAngle:QuarterValue)
            case .full:
                return ProgressAngleValue.init(startAngle: -QuarterValue, endAngle: FullValue)
            case .rightHalf:
                return ProgressAngleValue.init(startAngle: -QuarterValue, endAngle:QuarterValue)
            case .leftHalf:
                return ProgressAngleValue.init(startAngle: QuarterValue, endAngle:-QuarterValue)
            case .topHalf:
                return ProgressAngleValue.init(startAngle: -HalfValue, endAngle:0)
            case .bottomHalf:
                return ProgressAngleValue.init(startAngle:0 , endAngle:HalfValue)
            case .custom(let value):
                return value;
            default:
                return ProgressAngleValue.init(startAngle: 0, endAngle:0);
                
            }
        }
    }
    private var currentValue:TimeInterval=0{
        didSet{
        }
    }
    open var value:TimeInterval{
        set{
            self.currentValue = newValue;
            DispatchQueue.main.async {
                self.setAnimation(currentValue: self.currentValue, durationValue: self.durationValue, animationDuration: CircleProgress.animationDuration);
            }
        }get{
            return self.currentValue;
        }
    }
    open var durationValue:TimeInterval=0{
        didSet{
            self.setAnimation(currentValue: currentValue, durationValue: self.durationValue, animationDuration: CircleProgress.animationDuration);
        }
    }
    open var partialTrackWidth:CGFloat = 10{
        didSet{
            partialTrackLayer.lineWidth = self.partialTrackWidth
            
        }
    }
    open var fullTrackWidth:CGFloat = 10{
        didSet{
            fullTrackLayer.lineWidth = self.fullTrackWidth;
        }
    }
    open var partialTrackColor:UIColor=UIColor.red{
        didSet{
            partialTrackLayer.strokeColor = self.partialTrackColor.cgColor;
        }
    }
    open var fullTrackColor:UIColor=UIColor.lightGray{
        didSet{
            fullTrackLayer.strokeColor = self.fullTrackColor.cgColor;
            
        }
    }
    open var partialTrackShapeLayerLineCap:CAShapeLayerLineCap = CAShapeLayerLineCap.round{
        didSet{
            partialTrackLayer.lineCap = self.partialTrackShapeLayerLineCap;
        }
    }
    open var fullTrackShapeLayerLineCap:CAShapeLayerLineCap = CAShapeLayerLineCap.round{
        didSet{
            fullTrackLayer.lineCap = self.fullTrackShapeLayerLineCap
        }
    }
    open var angle:Angle = .full;
    
    private let partialTrackLayer = CAShapeLayer()
    private let fullTrackLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override open func layoutSubviews() {
        super.layoutSubviews();
        xibSetup()
    }
    public func refreshViews(){
        self.xibSetup();
    }
    func xibSetup(){
        if self.layer.sublayers?.count ?? 0 > 0 {
            self.partialTrackLayer.removeAllAnimations();
            self.partialTrackLayer.removeFromSuperlayer();
            self.layer.sublayers?.popLast();
        }
        // create my fullTrackLayer layer
        let angleValue:Angle = self.angle;
        let circularPath = UIBezierPath(arcCenter: self.trackCenterPoint(), radius:self.radius(frame:self.frame), startAngle:angleValue.progressAngleValue.startAngle, endAngle:angleValue.progressAngleValue.endAngle, clockwise: CircleProgress.clockwise)
        fullTrackLayer.path = circularPath.cgPath
        fullTrackLayer.strokeColor = self.fullTrackColor.cgColor
        fullTrackLayer.lineWidth = self.fullTrackWidth;
        fullTrackLayer.fillColor = UIColor.clear.cgColor
        fullTrackLayer.lineCap = self.fullTrackShapeLayerLineCap
        self.layer.addSublayer(fullTrackLayer)
        
        partialTrackLayer.path = circularPath.cgPath
        partialTrackLayer.strokeColor = self.partialTrackColor.cgColor;
        partialTrackLayer.lineWidth = self.partialTrackWidth
        partialTrackLayer.fillColor = UIColor.clear.cgColor
        partialTrackLayer.lineCap = self.partialTrackShapeLayerLineCap;
        partialTrackLayer.strokeEnd = 0
        self.layer.addSublayer(partialTrackLayer)
       // self.test();
    }
    func test(){
        self.durationValue = 0;
        self.value = 0;
    }
    public func setValue(value:TimeInterval,animationDuration:TimeInterval){
        self.setAnimation(currentValue:value, durationValue: self.durationValue, animationDuration: animationDuration);
        self.currentValue = value;
    }
    private func setAnimation(currentValue:TimeInterval,durationValue:TimeInterval,animationDuration:TimeInterval){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        /* will set last value befor set new value */
        basicAnimation.fromValue = rateValue(currentValue:self.currentValue,durationValue:durationValue);
        /**/
        basicAnimation.toValue = rateValue(currentValue:currentValue,durationValue:durationValue);
        basicAnimation.duration = animationDuration;
        basicAnimation.fillMode = CAMediaTimingFillMode.both
        basicAnimation.isRemovedOnCompletion = false
        partialTrackLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    private func rateValue(currentValue:TimeInterval,durationValue:TimeInterval)->Double{
        return (currentValue/durationValue);
    }
    func radius(frame:CGRect)->CGFloat{
        if frame.width < frame.height {
            return (frame.width/2)-self.fullTrackWidth;
        }else{
            return (frame.height/2)-self.fullTrackWidth;
        }
    }
    func trackCenterPoint()->CGPoint{
        return  CGPoint.init(x: self.center.x, y:(self.frame.height/2));
    }
}
