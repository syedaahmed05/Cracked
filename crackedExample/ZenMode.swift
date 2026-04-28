//
//  ZenMode.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/21/26.
//

import Foundation
import SpriteKit
import GameplayKit



//TODO: This file has everything that's only related to Zen mode (Timer instead of Lives)


extension GameScene {
    
    func zenMode() {
        print("This is zen mode")
        zenSetUp()
        startZenTimer()
        
    }
    
    func zenSetUp() {
        // Remove existing if any
        zenTimerLabel.removeFromParent()
        
        // Styling the timer
        zenTimerLabel.fontName = "Super Meatball"
        zenTimerLabel.fontSize = size.height * 0.04
        zenTimerLabel.fontColor = .customRed
        zenTimerLabel.horizontalAlignmentMode = .right
        
        // Position
        zenTimerLabel.position = CGPoint(x: size.width * 0.93, y: size.height * 0.03)
        zenTimerLabel.zPosition = 3
        
        // Intitial Text
        updateTimerText()
        
        addChild(zenTimerLabel)
        
    }
    
    
}
