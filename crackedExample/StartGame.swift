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
        // adding a backgound on the -1 layer
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.blendMode = .replace
        background.zPosition = -1   //LOWEST LAYER
        addChild(background)
        
        //add the chicken butt to the scene
        let chicken = SKSpriteNode(imageNamed: "wholeChicken")
        chicken.position = CGPoint(x: size.width / 2, y: self.size.height-30)
        chicken.zPosition = 2
        addChild(chicken)
        
        //add the pan to the scene
        let pan = SKSpriteNode(imageNamed: "pan")
        pan.position = CGPoint(x: size.width / 2 + 15, y: 70)
        pan.zPosition = 0
        addChild(pan)
        
        addingEggs()
        addingFeathers()
    }

}

