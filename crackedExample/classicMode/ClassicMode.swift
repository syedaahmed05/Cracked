//
//  ClassicMode.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/21/26.
//

import Foundation
import SpriteKit
import GameplayKit

//TODO: This file has everything that's only related to Classic mode (Lives instead of Timer)

extension GameScene {
    
    func classicMode() {
        print("This is Classic mode")
        classicSetup()
        
    }
    
    func classicSetup() {
        lifeNodes.removeAll() //clearing old nodes if restarting
        
        let lifeSpacing: CGFloat = 38.0
        let lifeSize: CGFloat = size.height * 0.038
        
        for i in 0..<3 {
            let lifeNode = SKSpriteNode(imageNamed: "grayX")
            lifeNode.size = CGSize(width: lifeSize, height: lifeSize)
            
            // Position them in a row from right to left
            let xPos = size.width * 0.85 - (CGFloat(i) * lifeSpacing)
            let yPos = size.height * 0.05
            
            lifeNode.position = CGPoint(x: xPos, y: yPos)
            lifeNode.zPosition = 100
            
            addChild(lifeNode)
            lifeNodes.append(lifeNode)
        }
        
    }
    
    func loseLife() {
       // check if we have lives left to lose
        if lives > 0 {
            let lifeIndex = lives - 1
            
            if lifeIndex < lifeNodes.count {
                let node = lifeNodes[lifeIndex]
                
                // Swap to red X asset
                node.texture = SKTexture(imageNamed: "redX")
                
                
                // Add a little pop animation so the player notices
                let scaleUp = SKAction.scale(by: 1.5, duration: 0.1)
                let scaleDown = SKAction.scale(to: 1.0, duration: 0.1)
                node.run(SKAction.sequence([scaleUp, scaleDown]))
            }
            lives -= 1
        }
        
        if lives <= 0 {
            gameOver()
        }
        
    }

}

