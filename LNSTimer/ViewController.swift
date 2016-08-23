//
//  ViewController.swift
//  LNSTimer
//
//  Created by Hoàng Minh Thành on 8/23/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var magin:CGFloat = 30
    var sobong = 6
    var LastOnLed = -1
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawball()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    var status:Bool = false
    func runningLed()
    {
        if LastOnLed != -1
        {
            turnOffLed()
        }
        if status == false
        {
            if LastOnLed != sobong-1
            {
                LastOnLed = LastOnLed + 1
            }
            else
            {
                status = true
            }
        }
        turnOnLed()
        if status == true
        {
            if LastOnLed != 0
            {
                turnOffLed()
            }
            if LastOnLed > 0
            {
                LastOnLed = LastOnLed - 1
            }
            else
            {
                status = false
            }
            turnOnLed()
        }
    }
    func turnOnLed(){
        if let ball = self.view.viewWithTag(100 + LastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "green")
        }
    }
    func turnOffLed(){
        if let ball = self.view.viewWithTag(100 + LastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "red")
        }
    }
    func drawball () {
        for indexhang in 0...sobong {
            for indexcot in 0...sobong {
                let image = UIImage(named: "red")
                let ball = UIImageView(image: image)
                ball.center = CGPointMake(magin + CGFloat(indexhang)*spacehang(), 70 + CGFloat(indexcot)*spacecot())
                ball.tag = indexhang + 100
                self.view.addSubview(ball)
            }
        }
        
    }
    func spacehang() -> CGFloat {
        let space = ((self.view.bounds.size.width - 2*magin)/(CGFloat(sobong-1)))
        return space
    }
    func spacecot() -> CGFloat {
        let space = ((self.view.bounds.size.height - 2*70)/(CGFloat(sobong-1)))
        return space
    }

}

