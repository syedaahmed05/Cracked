//
//  Settings.swift
//  crackedExample
//
//  Created by Angela on 2/4/26.
//

import Foundation
import SpriteKit
import UIKit
import SwiftUI

var musicSlider: SKSpriteNode!
let sliderWidth: CGFloat = 200

extension GameScene{
    
    func settingsView(){
        //removeAllChildren()
        //settingsPopUp.removeFromParent()
        if settingsPopUp.parent != nil { showPopup()
                return
            }
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: frame.size)
        darkenBg.position = CGPoint(x: frame.midX, y: frame.midY)
        darkenBg.zPosition = 99
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        settingsPopUp.size = CGSize(width: 700, height: 600)
        settingsPopUp.zPosition = 100
        settingsPopUp.position = CGPoint(x: frame.midX, y: frame.midY)  
        settingsPopUp.name = "settingsPopUp"
        if settingsPopUp.parent == nil {addChild(settingsPopUp)}

        let settingsTitle = SKLabelNode(fontNamed: "Super Meatball")
        settingsTitle.text = "Settings"
        settingsTitle.fontSize = 72
        settingsTitle.fontColor = .customRed
        settingsTitle.horizontalAlignmentMode = .center
        settingsTitle.position = CGPoint(x: 0, y: 220)
        settingsTitle.zPosition = 100
        settingsPopUp.addChild(settingsTitle)
        
        let settingsPlayBtn = SKSpriteNode(imageNamed: "settingsPlayBtn")
        settingsPlayBtn.position = CGPoint(x: -230, y: 120)
        settingsPlayBtn.zPosition = 100
        settingsPopUp.addChild(settingsPlayBtn)
        
        let resumeTitle = SKLabelNode(fontNamed: "Super Meatball")
        resumeTitle.text = "Resume"
        resumeTitle.fontSize = 48
        resumeTitle.fontColor = .customRed
        resumeTitle.horizontalAlignmentMode = .center
        resumeTitle.zPosition = 100
        resumeTitle.position = CGPoint(x: -70, y: 100)
        settingsPopUp.addChild(resumeTitle)
        
        let quitTitle = SKLabelNode(fontNamed: "Super Meatball")
        quitTitle.text = "Quit"
        quitTitle.fontSize = 48
        quitTitle.fontColor = .customRed
        quitTitle.horizontalAlignmentMode = .center
        quitTitle.zPosition = 100
        quitTitle.position = CGPoint(x: -105, y: 10)
        settingsPopUp.addChild(quitTitle)
        
        let settingsQuitBtn = SKSpriteNode(imageNamed: "settingsQuitBtn")
        settingsQuitBtn.position = CGPoint(x: -230, y: 30)
        settingsQuitBtn.zPosition = 100
        settingsPopUp.addChild(settingsQuitBtn)
        
        let settingsCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
        settingsCloseBtn.name = "settingsCloseBtn"
        settingsCloseBtn.zPosition = 100
        settingsCloseBtn.position = CGPoint(x: 300, y: 250)
        settingsCloseBtn.size = CGSize(width: 60, height: 60)
        settingsPopUp.addChild(settingsCloseBtn)
        
        
        let sfxBtn = SKSpriteNode(imageNamed: "sfxBtn")
        sfxBtn.position = CGPoint(x: -230, y: -150)
        sfxBtn.zPosition = 100
        settingsPopUp.addChild(sfxBtn)

        let musicBtn = SKSpriteNode(imageNamed: "musicBtn")
        musicBtn.position = CGPoint(x: -235, y: -60)
        musicBtn.zPosition = 100
        settingsPopUp.addChild(musicBtn)
        
        let musicCreditTitle = SKLabelNode(fontNamed: "Boba Milky")
        musicCreditTitle.text = "Music by Motorcity Era"
        musicCreditTitle.fontSize = 24
        musicCreditTitle.fontColor = .customRed
        musicCreditTitle.position = CGPoint(x: -70, y: -130)
        musicCreditTitle.zPosition = 100
        musicCreditTitle.horizontalAlignmentMode = .left
        settingsPopUp.addChild(musicCreditTitle)
        
        let musicSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        musicSliderBg.position = CGPoint(x: -70, y: -50)
        musicSliderBg.zPosition = 101
        musicSliderBg.name = "musicSliderBg"
        settingsPopUp.addChild(musicSliderBg)
        musicSliderMinX = musicSliderBg.position.x - sliderWidth / 2
        musicSliderMaxX = musicSliderBg.position.x + sliderWidth / 2
        musicSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
        musicSlider.size = CGSize(width: 40, height: 40)
        musicSlider.name = "musicSlider"
        musicSlider.zPosition = 102
        
        let sfxSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        sfxSliderBg.position = CGPoint(x: -70, y: -150)
        sfxSliderBg.zPosition = 101
        sfxSliderBg.name = "musicSliderBg"
        settingsPopUp.addChild(sfxSliderBg)
//        musicSliderMinX = musicSliderBg.position.x - sliderWidth / 2
//        musicSliderMaxX = musicSliderBg.position.x + sliderWidth / 2
//        musicSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
//        musicSlider.size = CGSize(width: 40, height: 40)
//        musicSlider.name = "musicSlider"
//        musicSlider.zPosition = 102
        
        let startX = musicSliderMinX + CGFloat(musicVolume) * sliderWidth
        musicSlider.position = CGPoint(x: startX, y: musicSliderBg.position.y)
        settingsPopUp.addChild(musicSlider)
        
        showPopup()
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
            //code to run after the animation completes,,
            
        }
    }

    func hidePopup() {
        settingsPopUp.removeAllActions()
        childNode(withName: "darkenBg")?.removeFromParent()

        let scaleDown = SKAction.scale(to: 0.5, duration: 0.2)
        let fadeOut = SKAction.fadeOut(withDuration: 0.2)
        let disappearGroup = SKAction.group([scaleDown, fadeOut])

        settingsPopUp.run(disappearGroup) {
            self.settingsPopUp.isHidden = true
            self.settingsPopUp.setScale(1.0)
            self.settingsPopUp.alpha = 1.0
        }
        if let darkenBg = childNode(withName: "darkenBg") as? SKSpriteNode {
            darkenBg.run(SKAction.fadeOut(withDuration: 0.25)) {
                darkenBg.removeFromParent()
            }
        }
    }
    
    func settingsMusicOnly(){
        if settingsMusicPopUp.parent != nil { showPopup()
                return
            }
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: frame.size)
        darkenBg.position = CGPoint(x: frame.midX, y: frame.midY)
        darkenBg.zPosition = 99
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        settingsMusicPopUp.size = CGSize(width: 700, height: 600)
        settingsMusicPopUp.zPosition = 100
        settingsMusicPopUp.position = CGPoint(x: frame.midX, y: frame.midY)
        settingsMusicPopUp.name = "settingsPopUp"
        if settingsMusicPopUp.parent == nil {addChild(settingsMusicPopUp)}

        let settingsTitle = SKLabelNode(fontNamed: "Super Meatball")
        settingsTitle.text = "Settings"
        settingsTitle.fontSize = 72
        settingsTitle.fontColor = .customRed
        settingsTitle.horizontalAlignmentMode = .center
        settingsTitle.position = CGPoint(x: 0, y: 220)
        settingsTitle.zPosition = 100
        settingsMusicPopUp.addChild(settingsTitle)
        
        let sfxBtn = SKSpriteNode(imageNamed: "sfxBtn")
        sfxBtn.position = CGPoint(x: -230, y: -150)
        sfxBtn.zPosition = 100
        settingsMusicPopUp.addChild(sfxBtn)

        let musicBtn = SKSpriteNode(imageNamed: "musicBtn")
        musicBtn.position = CGPoint(x: -235, y: -60)
        musicBtn.zPosition = 100
        settingsMusicPopUp.addChild(musicBtn)
        
        let musicCreditTitle = SKLabelNode(fontNamed: "Boba Milky")
        musicCreditTitle.text = "Music by Motorcity Era"
        musicCreditTitle.fontSize = 24
        musicCreditTitle.fontColor = .customRed
        musicCreditTitle.position = CGPoint(x: -190, y: -120)
        musicCreditTitle.zPosition = 100
        musicCreditTitle.horizontalAlignmentMode = .left
        settingsMusicPopUp.addChild(musicCreditTitle)
        
        let musicSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        musicSliderBg.position = CGPoint(x: -70, y: -50)
        musicSliderBg.zPosition = 101
        musicSliderBg.name = "musicSliderBg"
        settingsMusicPopUp.addChild(musicSliderBg)
        musicSliderMinX = musicSliderBg.position.x - sliderWidth / 2
        musicSliderMaxX = musicSliderBg.position.x + sliderWidth / 2
        musicSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
        musicSlider.size = CGSize(width: 40, height: 40)
        musicSlider.name = "musicSlider"
        musicSlider.zPosition = 102
        
        let sfxSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        sfxSliderBg.position = CGPoint(x: -70, y: -150)
        sfxSliderBg.zPosition = 101
        sfxSliderBg.name = "musicSliderBg"
        settingsMusicPopUp.addChild(sfxSliderBg)
        
        let startX = musicSliderMinX + CGFloat(musicVolume) * sliderWidth
        musicSlider.position = CGPoint(x: startX, y: musicSliderBg.position.y)
        settingsMusicPopUp.addChild(musicSlider)
        
        showPopup()
    }
}
