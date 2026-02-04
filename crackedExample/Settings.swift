//
//  Settings.swift
//  crackedExample
//
//  Created by Angela on 2/4/26.
//

import Foundation
import SpriteKit
extension GameScene{
    
    func settingsView(){
        removeAllChildren()
        
       
        
        
        
        showPopup()
        let settingsCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
        settingsCloseBtn.name = "settingsCloseBtn"
        settingsCloseBtn.position = CGPoint(x: 300, y: 500)
        settingsCloseBtn.size = CGSize(width: 60, height: 60)
        addChild(settingsCloseBtn)
    }
    
    
    func showPopup() {
        settingsPopUp.isHidden = false
        settingsPopUp.alpha = 0.0
        settingsPopUp.setScale(0.5)

        let fadeIn = SKAction.fadeIn(withDuration: 0.3)

        let scaleUp = SKAction.scale(to: 1.1, duration: 0.3)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.15)
        let popSequence = SKAction.sequence([scaleUp, scaleDown])

        let appearGroup = SKAction.group([fadeIn, popSequence])

            
        settingsPopUp.run(appearGroup) {
            //code to run after the animation completes
            
        }
    }

    func hidePopup() {
        let scaleDown = SKAction.scale(to: 0.5, duration: 0.2)
        let fadeOut = SKAction.fadeOut(withDuration: 0.2)
        let disappearGroup = SKAction.group([scaleDown, fadeOut])

        settingsPopUp.run(disappearGroup) {
            self.settingsPopUp.isHidden = true
            self.settingsPopUp.setScale(1.0)
            self.settingsPopUp.alpha = 1.0
        }
    }

    
}
