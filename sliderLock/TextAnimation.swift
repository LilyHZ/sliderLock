//
//  TextAnimation.swift
//  sliderLock
//
//  Created by xly on 15-5-28.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

class TextAnimation: NSObject {
    var animationView:UIView?
    var notHighlightColor:UIColor!
    var highlightColor:UIColor!
    var currentAnimation: CABasicAnimation?
    var effectWidth:CGFloat = 20.0  //width of the gradient color will effect
    
    var repeatCount:Float = 10000000   // here, we will let the animation repeat like forever
    var animationDuration: CFTimeInterval = 0.5
    var kTextAnimationKey = "TextAnimation"
    
    override init() {
        notHighlightColor = UIColor(white: 1.0, alpha: 0.3)
        highlightColor = UIColor.whiteColor()
    }
    
    func start(){
        if self.animationView == nil{
            println("animtion view is nil!")
            return
        }
        
        //clear things used last time
        self.stop()
        
        var gradientMask = CAGradientLayer()
        gradientMask.frame = self.animationView!.bounds
        
        var gradientSize = self.effectWidth/CGRectGetWidth(self.animationView!.frame)
        
        var startLocations:Array<AnyObject> = [0,gradientSize/2.0,gradientSize]
        var endLocations:Array<AnyObject> = [1.0 - gradientSize,1.0 - (gradientSize/2.0),1.0]
        
        var colors:Array<AnyObject> = [self.notHighlightColor.CGColor,self.highlightColor.CGColor,self.notHighlightColor.CGColor]
        
        gradientMask.colors = colors
        gradientMask.locations = startLocations
        gradientMask.startPoint = CGPointMake(-gradientSize, 0.5)
        gradientMask.endPoint = CGPointMake(1 + gradientSize, 0.5)
        
        self.animationView!.layer.mask = gradientMask
        
        self.currentAnimation = CABasicAnimation(keyPath: "locations")
        self.currentAnimation!.fromValue = startLocations
        self.currentAnimation!.toValue = endLocations
        self.currentAnimation!.repeatCount = self.repeatCount
        self.currentAnimation?.delegate = self
        
        gradientMask.addAnimation(self.currentAnimation, forKey: kTextAnimationKey)
        
    }
    
    func stop(){
        if self.animationView != nil && self.animationView?.layer.mask != nil{
            self.animationView?.layer.mask.removeAnimationForKey(kTextAnimationKey)
            self.animationView?.layer.mask = nil
            self.currentAnimation = nil
        }
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if anim == self.currentAnimation{
            self.stop()
        }
    }
}
