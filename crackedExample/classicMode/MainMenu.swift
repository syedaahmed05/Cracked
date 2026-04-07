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

         let titleFontSize = size.width * 0.12
         let buttonFontSize = size.width * 0.06
         
         let gameTitle = SKLabelNode(fontNamed:"Super Meatball")
         gameTitle.text = "Cracked!"
         gameTitle.fontSize = titleFontSize
         gameTitle.fontColor = SKColor.customRed
         gameTitle.position = CGPoint(x: 0, y: size.height * 0.25)
         gameTitle.zPosition = -1
         addChild(gameTitle)

         let playTitle = SKLabelNode(fontNamed:"Super Meatball")
         playTitle.text = "Play"
         playTitle.name = "playTitle"
         playTitle.fontSize = buttonFontSize
         playTitle.fontColor = SKColor.customOrange
         playTitle.position = CGPoint(x:size.width * 0,y: size.height * 0.18)
         playTitle.zPosition = 1
         addChild(playTitle)
         
         let playBtn = SKSpriteNode(imageNamed: "play.fill")
         playBtn.name = "playBtn"
         playBtn.setScale(size.width * 0.0015)
         playBtn.position = CGPoint(x: -size.width * 0, y: size.height * 0.1)
         addChild(playBtn)
         
         let mainMenuImage = SKSpriteNode(imageNamed: "mainMenuImage")
         mainMenuImage.name = "mainMenuImage"
         mainMenuImage.size = CGSize(width: size.width * 0.5, height: size.height * 0.3)
         mainMenuImage.position = CGPoint(x:size.width * 0.0 , y: -size.height * 0.20 )
         mainMenuImage.zPosition = 1
         addChild(mainMenuImage)
         
         let settingsMusicBtn = SKSpriteNode(imageNamed: "gearshape.circle.fill")
         settingsMusicBtn.setScale(size.width * 0.001)
         settingsMusicBtn.name = "settingsMusicBtn"
         settingsMusicBtn.position = CGPoint(x: -size.width * 0.45 , y: size.height * 0.45)
         addChild(settingsMusicBtn)
         
         
         let infoBtn = SKSpriteNode(imageNamed: "info.circle.fill")
         infoBtn.name = "infoBtn"
         infoBtn.setScale(size.width * 0.001)
         infoBtn.position = CGPoint(x: size.width * 0.45, y: size.height * 0.45)
         addChild(infoBtn)
         
//         let exBtn = SKSpriteNode(imageNamed: "play.fill")
//         exBtn.name = "exBtn"
//         exBtn.position = CGPoint(x: 50, y: 50)
//         addChild(exBtn)
     }
     
     
     func info() {
         currentScene = .info
         removeAllChildren()
         backgroundColor = .customBeige

         let infoCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
         infoCloseBtn.name = "infoCloseBtn"
         infoCloseBtn.position = CGPoint(x: size.width * 0.40,y: size.height * 0.40)
         infoCloseBtn.size = CGSize(width: size.width * 0.08, height: size.height * 0.08)
         addChild(infoCloseBtn)

         let infoTitle = SKLabelNode(fontNamed: "Super Meatball")
         infoTitle.text = "How to Play"
         infoTitle.fontSize = size.width * 0.09
         infoTitle.fontColor = .customRed
         infoTitle.position = CGPoint(x: size.width * 0.0, y: size.height * 0.35)
         addChild(infoTitle)

         
         let rulesContainer = SKNode()
         rulesContainer.position = CGPoint(x: -size.width * 0.1, y: size.height * 0.25)
         addChild(rulesContainer)

         let rulesData: [(String, String)] = [
             ("Rule 1:", "Single tap the eggs to earn points! Miss an egg? You loose a life!"),
             ("Rule 2:", "Fill the pan with eggs. Swipe left on the pan to continue filling or else you loose a life."),
             ("Rule 3:", "Swipe the feathers away to prevent them from falling in the pan or loose a life."),
             ("Rule 4:", "You have 3 lives. Tap the 'Replay' button to start a new game or tap the 'Home' button to return to the main menu.")
         ]

         let rowSpacing = size.height * 0.13

         for (index, rule) in rulesData.enumerated() {

             let yOffset = CGFloat(-index) * rowSpacing

             let ruleLabel = SKLabelNode(fontNamed: "Super Meatball")
             ruleLabel.text = rule.0
             ruleLabel.fontSize = size.width * 0.05
             ruleLabel.fontColor = .customOrange
             ruleLabel.horizontalAlignmentMode = .right
             ruleLabel.position = CGPoint(x: -size.width * 0.12, y: yOffset)

             let ruleText = SKLabelNode(fontNamed: "Boba Milky")
             ruleText.text = rule.1
             ruleText.fontSize = size.width * 0.035
             ruleText.fontColor = .customRed
             ruleText.horizontalAlignmentMode = .left
             ruleText.verticalAlignmentMode = .top
             ruleText.preferredMaxLayoutWidth = size.width * 0.55
             ruleText.numberOfLines = 0
             ruleText.position = CGPoint(x: -size.width * 0.08, y: yOffset + size.height * 0.03)

             rulesContainer.addChild(ruleLabel)
             rulesContainer.addChild(ruleText)
         }
     }


}
