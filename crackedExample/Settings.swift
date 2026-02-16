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
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: CGSize(width: size.width,height: size.height))
        darkenBg.position = CGPoint(x: size.width * 0.0, y: size.height * 0.0)
        darkenBg.zPosition = 99
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        settingsPopUp.size = CGSize(width: size.width * 0.8, height: size.height * 0.4)
        settingsPopUp.position = CGPoint(x: size.width * 0.0, y: size.height * 0.0)
        settingsPopUp.zPosition = 100
        settingsPopUp.isHidden = false
        settingsPopUp.name = "settingsPopUp"
        if settingsPopUp.parent == nil {addChild(settingsPopUp)}
        
        let popupW = settingsPopUp.size.width
        let popupH = settingsPopUp.size.height
        
        let settingsTitle = SKLabelNode(fontNamed: "Super Meatball")
        settingsTitle.text = "Settings"
        settingsTitle.fontSize = popupW * 0.08
        settingsTitle.fontColor = .customRed
        settingsTitle.horizontalAlignmentMode = .center
        settingsTitle.position = CGPoint(x: 0, y: popupH * 0.35)
        settingsTitle.zPosition = 101
        settingsPopUp.addChild(settingsTitle)
        
        let settingsPlayBtn = SKSpriteNode(imageNamed: "settingsPlayBtn")
        settingsPlayBtn.name = "settingsPlayBtn"
        settingsPlayBtn.position = CGPoint(x: -popupW * 0.25, y: popupH * 0.12)
        settingsPlayBtn.zPosition = 101
        settingsPopUp.addChild(settingsPlayBtn)
        
        let resumeTitle = SKLabelNode(fontNamed: "Super Meatball")
        resumeTitle.text = "Resume"
        resumeTitle.fontSize = popupW * 0.05
        resumeTitle.fontColor = .customRed
        resumeTitle.horizontalAlignmentMode = .center
        resumeTitle.zPosition = 101
        resumeTitle.position = CGPoint(x: popupW * 0.05, y: popupH * 0.12)
        settingsPopUp.addChild(resumeTitle)
        
        let quitTitle = SKLabelNode(fontNamed: "Super Meatball")
        quitTitle.name = "settingsQuitTitle"
        quitTitle.text = "Quit"
        quitTitle.fontSize = popupW * 0.05
        quitTitle.fontColor = .customRed
        quitTitle.horizontalAlignmentMode = .center
        quitTitle.zPosition = 101
        quitTitle.position = CGPoint(x:0, y: -popupH * 0.15)
        settingsPopUp.addChild(quitTitle)
        
        let settingsQuitBtn = SKSpriteNode(imageNamed: "settingsQuitBtn")
        settingsQuitBtn.name = "settingsQuitBtn"
        settingsQuitBtn.position = CGPoint(x: popupW * 0.25, y: -popupH * 0.12)
        settingsQuitBtn.zPosition = 101
        settingsPopUp.addChild(settingsQuitBtn)
        
        let settingsCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
        settingsCloseBtn.name = "settingsCloseBtn"
        settingsCloseBtn.zPosition = 101
        settingsCloseBtn.position = CGPoint(x: popupW * 0.42, y: popupH * 0.42)
        settingsCloseBtn.size = CGSize(width: popupW * 0.08, height: popupW * 0.08)
        settingsPopUp.addChild(settingsCloseBtn)
        
        
        let sfxBtn = SKSpriteNode(imageNamed: "sfxBtn")
        //sfxBtn.setScale(popupW * 0.0015)
        sfxBtn.position = CGPoint(x: -popupW * 0.35,y: -popupH * 0.08)
        sfxBtn.zPosition = 101
        settingsPopUp.addChild(sfxBtn)

        let musicBtn = SKSpriteNode(imageNamed: "musicBtn")
        musicBtn.setScale(popupW * 0.0015)
        musicBtn.position = CGPoint(x: -popupW * 0.35,y: -popupH * 0.08)
        musicBtn.zPosition = 101
        settingsPopUp.addChild(musicBtn)
        
        let musicCreditTitle = SKLabelNode(fontNamed: "Boba Milky")
        musicCreditTitle.text = "Music by Motorcity Era"
        musicCreditTitle.fontSize = popupH * 0.05
        musicCreditTitle.fontColor = .customRed
        musicCreditTitle.position = CGPoint(x: -popupW * 0.3,y: -popupH * 0.15)
        musicCreditTitle.zPosition = 101
        musicCreditTitle.horizontalAlignmentMode = .left
        settingsPopUp.addChild(musicCreditTitle)
        
        let musicSliderBg = SKSpriteNode(color: .customOrange, size:CGSize(width: sliderWidth,height: 10))
        musicSliderBg.position = CGPoint(x: -popupW * 0.18,y: -popupH * 0.1)
        musicSliderBg.zPosition = 101
        musicSliderBg.name = "musicSliderBg"
        settingsPopUp.addChild(musicSliderBg)
        
        musicSliderMinX = musicSliderBg.position.x - sliderWidth / 2
        musicSliderMaxX = musicSliderBg.position.x + sliderWidth / 2
        
        musicSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
        musicSlider.size = CGSize(width: popupW * 0.08,height: popupW * 0.08)
        musicSlider.name = "musicSlider"
        musicSlider.zPosition = 102
        
        let sfxSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        sfxSliderBg.position = CGPoint(x: -popupW * 0.18,y: -popupH * 0.1)
        sfxSliderBg.zPosition = 101
        sfxSliderBg.name = "musicSliderBg"
        settingsPopUp.addChild(sfxSliderBg)
        
        let startX = musicSliderMinX + CGFloat(musicVolume) * sliderWidth
        musicSlider.position = CGPoint(x: startX, y: musicSliderBg.position.y)
        settingsPopUp.addChild(musicSlider)
        
        showPopup()
    }
    
    func showPopup() {
        settingsPopUp.isHidden = false
        settingsPopUp.alpha = 0.0
        settingsPopUp.setScale(0.5)
        
//        settingsMusicPopUp.isHidden = false
//        settingsMusicPopUp.alpha = 0.0
//        settingsMusicPopUp.setScale(0.5)
        
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
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: CGSize(width: size.width, height: size.height))
        darkenBg.position = CGPoint(x: size.width * 0.0,y: size.height * 0.0)
        darkenBg.zPosition = 99
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        settingsMusicPopUp.size = CGSize(width: size.width * 0.8,height:size.height * 0.4)
        settingsMusicPopUp.zPosition = 100
        settingsMusicPopUp.position = CGPoint(x: size.width * 0.0,y: size.height * 0.0)
        settingsMusicPopUp.name = "settingsMusicPopUp"
        if settingsMusicPopUp.parent == nil {addChild(settingsMusicPopUp)}
        
        let popupW = settingsMusicPopUp.size.width
        let popupH = settingsMusicPopUp.size.height
        
        let settingsTitle = SKLabelNode(fontNamed: "Super Meatball")
        settingsTitle.text = "Settings"
        settingsTitle.fontSize = popupH * 0.10
        settingsTitle.fontColor = .customRed
        settingsTitle.horizontalAlignmentMode = .center
        settingsTitle.position = CGPoint(x: 0, y: popupH * 0.35)
        settingsTitle.zPosition = 100
        settingsMusicPopUp.addChild(settingsTitle)
        
        let sfxBtn = SKSpriteNode(imageNamed: "sfxBtn")
        sfxBtn.position = CGPoint(x: -popupW * 0.35, y: popupH * 0.15)
        sfxBtn.zPosition = 100
        settingsMusicPopUp.addChild(sfxBtn)

        let musicBtn = SKSpriteNode(imageNamed: "musicBtn")
        musicBtn.position = CGPoint(x: -popupW * 0.35, y: -popupH * 0.08)
        musicBtn.zPosition = 100
        settingsMusicPopUp.addChild(musicBtn)
        
        let settingsMusicCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
        settingsMusicCloseBtn.name = "settingsMusicCloseBtn"
        settingsMusicCloseBtn.zPosition = 100
        settingsMusicCloseBtn.position = CGPoint(x: popupW * 0.42, y: popupH * 0.42)
        settingsMusicCloseBtn.size = CGSize(width: popupW * 0.08, height: popupW * 0.08)
        settingsMusicPopUp.addChild(settingsMusicCloseBtn)
        
        let musicCreditTitle = SKLabelNode(fontNamed: "Boba Milky")
        musicCreditTitle.text = "Music by Motorcity Era"
        musicCreditTitle.fontSize = popupH * 0.05
        musicCreditTitle.fontColor = .customRed
        musicCreditTitle.position = CGPoint(x: -popupW * 0.3, y: popupH * 0.05)
        musicCreditTitle.zPosition = 100
        musicCreditTitle.horizontalAlignmentMode = .left
        settingsMusicPopUp.addChild(musicCreditTitle)
        
        let musicSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        musicSliderBg.position = CGPoint(x: -popupW * 0.18, y: popupH * 0.15)
        musicSliderBg.zPosition = 101
        musicSliderBg.name = "musicSliderBg"
        settingsMusicPopUp.addChild(musicSliderBg)
        
        musicSliderMinX = musicSliderBg.position.x - musicSliderBg.size.width / 2
        musicSliderMaxX = musicSliderBg.position.x + musicSliderBg.size.width / 2
        
        musicSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
        musicSlider.size = CGSize(width: popupW * 0.04, height: popupW * 0.04)
        musicSlider.name = "musicSlider"
        musicSlider.zPosition = 102
        
        let sfxSliderBg = SKSpriteNode(color: .customOrange, size: CGSize(width: sliderWidth, height: 10))
        sfxSliderBg.position = CGPoint(x: -popupW * 0.18, y: -popupH * 0.08)
        sfxSliderBg.zPosition = 101
        sfxSliderBg.name = "musicSliderBg"
        settingsMusicPopUp.addChild(sfxSliderBg)
        
        
        let sfxSlider = SKSpriteNode(imageNamed: "sliderCircleBtn")
        musicSliderMinX = musicSliderBg.position.x - sliderWidth / 2
        musicSliderMaxX = musicSliderBg.position.x + sliderWidth / 2
        sfxSlider.size = CGSize(width:popupW*0.08,height:popupW * 0.08)
        sfxSlider.name = "sfxSlider"
        sfxSlider.zPosition = 102

        
        let startX = musicSliderMinX + CGFloat(musicVolume) * sliderWidth
        musicSlider.position = CGPoint(x: startX, y: musicSliderBg.position.y)
        settingsMusicPopUp.addChild(musicSlider)
        
        
        
        
        showPopup()
    }
}
