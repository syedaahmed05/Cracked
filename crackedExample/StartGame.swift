//
//  StartGame.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/9/26.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    func gameSetup() {
        currentScene = .startGame
        removeAllChildren()
        // adding a backgound on the -1 layer
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width * 0.0, y: size.height * 0.0) 
        background.blendMode = .replace
        background.size = self.size
        background.zPosition = -1   //LOWEST LAYER
        addChild(background)
        
        //add the chicken butt to the scene
        let chicken = SKSpriteNode(imageNamed: "wholeChicken")
        chicken.position = CGPoint(x: size.width * 0.0, y: size.height * 0.4)
        chicken.zPosition = 2
        addChild(chicken)
        
        //add the pan to the scene
        let pan = SKSpriteNode(imageNamed: "pan")
        pan.position = CGPoint(x: size.width * 0.05 , y: -size.height * 0.35)
        pan.zPosition = 0
        addChild(pan)
        
        let pauseBtn = SKSpriteNode(imageNamed: "pauseBtn")
        pauseBtn.name = "pauseBtn"
        pauseBtn.size = CGSize(width: size.width * 0.04, height: size.height * 0.04)
        pauseBtn.position = CGPoint(x:size.width  * 0.45,y: size.height * 0.45)
        pauseBtn.zPosition = 5
        addChild(pauseBtn)
        
        addingEggs()
        addingFeathers()
    }

}

