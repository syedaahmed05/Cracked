//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.
//
import SpriteKit

import Foundation
 extension GameScene {
    
     func mainMenu(){
         currentScene = .mainMenu
         removeAllChildren()
         backgroundColor = .customBeige
         
         let gameTitle = SKLabelNode(fontNamed:"Super Meatball")
         gameTitle.text = "Cracked!"
         gameTitle.fontSize = 140
         gameTitle.fontColor = SKColor.customRed
         gameTitle.position = CGPoint(x: 5, y: 250)
         gameTitle.zPosition = -1
         addChild(gameTitle)
         
 //        let playBtn = buttonStyle(text: "Play", position: CGPoint(x: frame.midX, y: frame.midY + 50), name: "playBtn" )
 //        addChild(playBtn)
 //
 //        let settingsBtn = buttonStyle(text: "Settings", position: CGPoint(x: frame.midX, y: frame.midY + 150), name: "settingsBtn" )
 //        addChild(settingsBtn)
         
         let playTitle = SKLabelNode(fontNamed:"Super Meatball")
         playTitle.text = "Play"
         playTitle.fontSize = 72
         playTitle.fontColor = SKColor.customOrange
         playTitle.position = CGPoint(x: -5, y: 130)
         playTitle.zPosition = 1
         addChild(playTitle)
         
         let playBtn = SKSpriteNode(imageNamed: "play.fill")
         playBtn.name = "playBtn"
         playBtn.position = CGPoint(x: -5, y: 50)
         addChild(playBtn)
         
         let mainMenuImage = SKSpriteNode(imageNamed: "mainMenuImage")
         mainMenuImage.name = "mainMenuImage"
         mainMenuImage.size = CGSize(width: 600, height: 450)
         mainMenuImage.position = CGPoint(x: 0, y: -200)
         mainMenuImage.zPosition = 1
         addChild(mainMenuImage)
         
         let settingsBtn = SKSpriteNode(imageNamed: "gearshape.circle.fill")
         settingsBtn.name = "settingsBtn"
         settingsBtn.position = CGPoint(x: -350, y: 550)
         addChild(settingsBtn)
         
         
         let infoBtn = SKSpriteNode(imageNamed: "info.circle.fill")
         infoBtn.name = "infoBtn"
         infoBtn.position = CGPoint(x: 350, y: 550)
         addChild(infoBtn)
         
     }
     
     
     func info() {
         currentScene = .info
         removeAllChildren()
         backgroundColor = .customBeige

         let infoCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
         infoCloseBtn.name = "infoCloseBtn"
         infoCloseBtn.position = CGPoint(x: frame.maxX - 60, y: frame.maxY - 60)
         infoCloseBtn.size = CGSize(width: 60, height: 60)
         addChild(infoCloseBtn)

         let infoTitle = SKLabelNode(fontNamed: "Super Meatball")
         infoTitle.text = "How to Play"
         infoTitle.fontSize = 90
         infoTitle.fontColor = .customRed
         infoTitle.position = CGPoint(x: frame.midX, y: frame.maxY - 140)
         addChild(infoTitle)

         
         let rulesContainer = SKNode()
         rulesContainer.position = CGPoint(x: frame.midX, y: frame.midY + 300)
         addChild(rulesContainer)

         let rulesData: [(String, String)] = [
             ("Rule 1:", "Single tap the eggs to earn points! Miss an egg? You loose a life!"),
             ("Rule 2:", "Fill the pan with eggs. Swipe left on the pan to continue filling or else you loose a life."),
             ("Rule 3:", "Swipe the feathers away to prevent them from falling in the pan or loose a life."),
             ("Rule 4:", "You have 3 lives. Tap the 'Replay' button to start a new game or tap the 'Home' button to return to the main menu.")
         ]

         let rowSpacing: CGFloat = 200

         for (index, rule) in rulesData.enumerated() {

             let yOffset = CGFloat(-index) * rowSpacing

             let ruleLabel = SKLabelNode(fontNamed: "Super Meatball")
             ruleLabel.text = rule.0
             ruleLabel.fontSize = 72
             ruleLabel.fontColor = .customOrange
             ruleLabel.horizontalAlignmentMode = .right
             ruleLabel.position = CGPoint(x: -180, y: yOffset)

             let ruleText = SKLabelNode(fontNamed: "Boba Milky")
             ruleText.text = rule.1
             ruleText.fontSize = 40
             ruleText.fontColor = .customRed
             ruleText.horizontalAlignmentMode = .left
             ruleText.verticalAlignmentMode = .top
             ruleText.preferredMaxLayoutWidth = 500
             ruleText.numberOfLines = 0
             ruleText.position = CGPoint(x: -100, y: yOffset + 60)

             rulesContainer.addChild(ruleLabel)
             rulesContainer.addChild(ruleText)
         }
     }


}
