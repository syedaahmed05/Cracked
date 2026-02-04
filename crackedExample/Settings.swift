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
        
        let settingsTitle = SKLabelNode(fontNamed: "Super Meatball")
        settingsTitle.text = "Settings"
        settingsTitle.fontSize = 72
        settingsTitle.fontColor = .customRed
        settingsTitle.horizontalAlignmentMode = .center
        settingsTitle.zPosition = 100
        addChild(settingsTitle)
        settingsPopUp.name = "settingsPopUp"
    
        let resumeTitle = SKLabelNode(fontNamed: "Super Meatball")
        resumeTitle.text = "resumeTitle"
        resumeTitle.fontSize = 48
        resumeTitle.fontColor = .customRed
        resumeTitle.horizontalAlignmentMode = .center
        resumeTitle.zPosition = 100
        addChild(resumeTitle)
        
        let quitTitle = SKLabelNode(fontNamed: "Super Meatball")
        quitTitle.text = "quitTitle"
        quitTitle.fontSize = 72
        quitTitle.fontColor = .customRed
        quitTitle.horizontalAlignmentMode = .center
        quitTitle.zPosition = 100
        addChild(quitTitle)
        
        //showPopup()
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
