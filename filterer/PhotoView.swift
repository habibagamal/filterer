//
//  PhotoView.swift
//  filterer
//
//  Created by Habiba Bassem on 1/13/19.
//  Copyright © 2019 Habiba Bassem. All rights reserved.
//

import UIKit

class PhotoView: UIImageView {

    var lastTouchTime: NSDate? = nil
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first{
            let location = touch.location(in: self)
            print("x:\(location.x) y:\(location.y)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let currentTime = NSDate()
        if let previousTime = lastTouchTime {
            if currentTime.timeIntervalSince(previousTime as Date) < 0.5 {
                print ("Double Tap")
                lastTouchTime = nil
            }
            else {
                lastTouchTime = currentTime
            }
        }
        else{
            lastTouchTime = currentTime
        }
    }
    
    
}

