//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26.
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
         //mainMenuImage.position = CGSize(width: size., height: <#T##Int#>)
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
     
     
     func info(){
         currentScene = .info
         removeAllChildren()
         backgroundColor = .customBeige
         
         
         let infoCloseBtn = SKSpriteNode(imageNamed: "infoCloseBtn")
         infoCloseBtn.name = "infoCloseBtn"
         infoCloseBtn.position = CGPoint(x: 300, y: 500)
         infoCloseBtn.size = CGSize(width: 60, height: 60)
         addChild(infoCloseBtn)
         
         
         let infoTitle = SKLabelNode(fontNamed: "Super Meatball")
         infoTitle.text = "How to Play"
         infoTitle.name = "infoTitle"
         //infoTitle.position = CGPoint(x: 300, y: 500)
         infoTitle.color = .customRed
         infoTitle.horizontalAlignmentMode = .center
         infoTitle.verticalAlignmentMode = .center
         addChild(infoTitle)
         
         let rules = SKLabelNode(fontNamed: "Boba Milky")
         rules.name = "rules"
         rules.text = "Rule 1: \n\nRule 2: \n\nRule 3: \n\nRule 4: "
         rules.numberOfLines = 0
         rules.lineBreakMode = .byWordWrapping
         rules.preferredMaxLayoutWidth = 200
         rules.horizontalAlignmentMode = .right
         rules.fontSize = 40
         rules.fontColor = SKColor.customOrange
         rules.position = CGPoint(x: frame.midX, y: frame.midY)
         rules.zPosition = 1
         addChild(rules)

         let rulesText1 = SKLabelNode(fontNamed: "Boba Milky")
         rulesText1.name = "rulesText1"
         rulesText1.text = "Single tap the eggs to earn points and beat your highscore!"
         rulesText1.lineBreakMode = .byWordWrapping
         rulesText1.numberOfLines = 0
         rulesText1.preferredMaxLayoutWidth = 200
         rulesText1.horizontalAlignmentMode = .left
         rulesText1.fontSize = 30
         rulesText1.fontColor = SKColor.customOrange
         rulesText1.position = CGPoint(x: rulesText1.frame.maxX + 5, y:100)
         rulesText1.zPosition = 1
         addChild(rulesText1)
         
         
     }
}
