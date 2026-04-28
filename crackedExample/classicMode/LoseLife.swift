//
//  LoseLife.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/27/26.
//

import SpriteKit
import GameplayKit
import SwiftUI
import GameKit
import Combine

extension GameScene {
    
    func loseLife() {
        if lives > 0 {
            let lifeIndex = lives - 1
            
            if lifeIndex < lifeNodes.count {
                let node = lifeNodes[lifeIndex]
                
                if lives == 2 {
                    playMusic(named: "crackedDoomVer", volume: 0.8)
                }
                
                // Call the chef
                callChef()
                
                // Swap to red X asset
                node.texture = SKTexture(imageNamed: "redX")
                
                // Add a little pop animation so the player notices
                let scaleUp = SKAction.scale(by: 2, duration: 0.3)
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

