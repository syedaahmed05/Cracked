//
//  StartGame.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/9/26.

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    // TODO: Common game setup for both modes
    func gameSetup() {
        currentScene = .startGame
        removeAllChildren()
        
        // Adding a backgound on the -1 layer
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.blendMode = .replace
        background.size = self.size
        background.zPosition = -1   //LOWEST LAYER
        addChild(background)
        
        // Adding the chicken to the scene
        let chicken = SKSpriteNode(imageNamed: "wholeChicken")
        let chickenWidth = size.width * 0.85
        chicken.size = CGSize(width: chickenWidth, height: chickenWidth*0.9)
        chicken.position = CGPoint(x: size.width * 0.5, y: size.height * 0.92)
        chicken.zPosition = 2
        addChild(chicken)
        
        // Adding the pan to the scene
        pan.position = CGPoint(x: size.width * 0.52 , y: size.height * 0.20)
        pan.zPosition = 1
        pan.name = "pan"
        addChild(pan)
        
        // Adding the Score to the bottom left
        scoreLabel.fontSize = size.height * 0.04
        scoreLabel.fontName = "Super Meatball"
        scoreLabel.fontColor = .customRed
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.position = CGPoint(x: size.width * 0.07, y: size.height * 0.03)
        scoreLabel.zPosition = 3
        addChild(scoreLabel)
        
        
        // Adding the pause button at the top right
        let pauseBtn = SKSpriteNode(imageNamed: "pauseBtn")
        pauseBtn.name = "pauseBtn"
        let btnDim = size.width * 0.08
        pauseBtn.size = CGSize(width: btnDim, height: btnDim)
        pauseBtn.position = CGPoint(x:size.width  * 0.91,y: size.height * 0.94)
        pauseBtn.zPosition = 5
        addChild(pauseBtn)
        
        // Adding the Eggs and Feathers (Uses EggLogic file and FeatherLogic file)
        addingEggs()
        addingFeathers()
    }

}




