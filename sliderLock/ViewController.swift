//
//  ViewController.swift
//  sliderLock
//
//  Created by xly on 15-5-27.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var textExampleLabel:UILabel!
    var textAnimation: TextAnimation! = TextAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
//        var gradientMask = CAGradientLayer()
//        var colors:Array<AnyObject> = [UIColor.blackColor().CGColor,UIColor.whiteColor().CGColor,UIColor.blackColor().CGColor]
//        gradientMask.colors = colors
        
        textExampleLabel = UILabel(frame: CGRectMake(10, 100, UIScreen.mainScreen().bounds.size.width - 20, 30))//UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.width/2 - 150, UIScreen.mainScreen().bounds.height/2 - 15, 300, 30))
        textExampleLabel.text = "slider to unlock your phone"
//        textExampleLabel.textAlignment = NSTextAlignment.Center
        textExampleLabel.backgroundColor = UIColor.blackColor()
        textExampleLabel.textColor = UIColor.whiteColor()
        
//        textExampleLabel.layer.mask = gradientMask
        
        self.view.addSubview(textExampleLabel)
        
//        self.textAnimation = textAnimation
        self.textAnimation.animationView = textExampleLabel
        self.textAnimation.effectWidth = 50.0
        
//        var testGradient = CAGradientLayer()
//        testGradient.frame = self.textExampleLabel.bounds
//        
//        testGradient.colors = [UIColor(white: 1.0, alpha: 0.3).CGColor,UIColor.yellowColor().CGColor,UIColor(white: 1.0, alpha: 0.3).CGColor]
//        testGradient.startPoint = CGPointMake(0, 0.5)
//        testGradient.endPoint = CGPointMake(1, 0.5)
//        testGradient.locations = [0,0.15,0.3]
//        
//        textExampleLabel.layer.mask = testGradient
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

