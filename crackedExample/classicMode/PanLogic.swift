//
//  PanLogic.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/12/26.
//
import Foundation
import SpriteKit
import GameplayKit


extension GameScene {
    
    func setupPanCounter() {
        panCounterLabel.removeFromParent()
        panCounterLabel.name = "panCounter"
        panCounterLabel.fontSize = 24
        panCounterLabel.fontColor = .customRed
        panCounterLabel.fontName = "Avenir-Black"
        panCounterLabel.position = CGPoint(x: -40 , y: -33) // Adjust based on your pan image
        panCounterLabel.text = "\(currentPanCount) / \(panLimit)"
        panCounterLabel.zPosition = 10
        pan.addChild(panCounterLabel)
    }
    
    func swipePan(_ pan: SKSpriteNode, direction: CGVector) {
            guard direction.dx < -40, !pan.hasActions() else { return }
        
            // Play Bell Sound when sold
            playSound("bellSFX", volume: 1.0)
            var coinsToAward = 0
            
            let moveOut = SKAction.moveTo(x: -pan.size.width, duration: 0.3)
            
            let resetPan = SKAction.run { [weak self] in
                guard let self = self else { return }
                
                pan.position.x = self.size.width + pan.size.width
                pan.texture = SKTexture(imageNamed: "emptyPan")
                
                // RESET LOGIC
                self.panIsFull = false
                self.currentPanCount = 0
                self.panLimit = Int.random(in: 5...15) // New random limit
                self.panCounterLabel.text = "0 / \(self.panLimit)"
            }
        
            if gameMode == .classic {
                coinsToAward = currentPanCount // Award based on current count
            } else if gameMode == .zen {
                if currentPanCount >= panLimit {
                    coinsToAward = currentPanCount // Only award if full
                }
            }

            if coinsToAward > 0 {
                PlayerProfile.addCoins(coinsToAward) // Save coins immediately
            }
            
            let moveIn = SKAction.moveTo(x: size.width * 0.52, duration: 0.3)
            pan.run(SKAction.sequence([moveOut, resetPan, moveIn]))
    }
    
    func fillPan(with eggNode: SKNode) {
            guard currentPanCount < panLimit else { return }
        
           // Play Sizzle Sound when filling "TOOOO loud" get another one
            playSound("sizzlePanSFX", volume: 0.5)
            
            currentPanCount += 1
            panCounterLabel.text = "\(currentPanCount) / \(panLimit)"
        
            // Remove the egg immediately
            eggNode.removeFromParent()
        
        if currentPanCount >= panLimit {
                // MAX REACHED
                panIsFull = true
                pan.texture = SKTexture(imageNamed: "fullPan")
                
                // Quick "pop" effect to show it's full
                pan.run(SKAction.sequence([
                    SKAction.scale(to: 1.1, duration: 0.05),
                    SKAction.scale(to: 1.0, duration: 0.05)
                ]))
            } else if currentPanCount >= 1 {
                // FIRST EGG DROPPED (and anything until max)
                pan.texture = SKTexture(imageNamed: "halfPan")
            }


        }
}


//extension GameScene {
//    
//    func swipePan(_ pan: SKSpriteNode, direction: CGVector) {
//        guard direction.dx < -40 else { return }
//        
//        pan.removeAllActions()
//        
//        let moveOut = SKAction.moveTo(
//            x: -pan.size.width,
//            duration: 0.35
//        )
//        
//        let remove = SKAction.removeFromParent()
//        let spawnNewPan = SKAction.run { [weak self] in
//            self?.spawnNewPan(pan)
//        }
//        
//        pan.run(SKAction.sequence([moveOut, remove, spawnNewPan]))
//        
//    }
//    
//    //CGPoint(
////    x: size.width + pan.size.width,
////    y: yPos
////)
//    func spawnNewPan(_ pan: SKSpriteNode) {
//        //let yPos = pan.size.height / 2 + 20
//        pan.position = CGPoint(x: size.width * 0.05 , y: -size.height * 0.35)
//        pan.texture = SKTexture(imageNamed: "emptyPan")
//        //pan.name = "emptyPan"
//        panIsFull = false
//        
//        addChild(pan)
//        
//        let moveIn = SKAction.moveTo(
//            x: size.width * 0.05 ,
//            duration: 0.35
//        )
//        
//        pan.run(moveIn)
//    }
//    
//    func fillPan(with eggNode: SKNode) {
//
//        panIsFull = true
//
//        // Fade out egg
//        let fade = SKAction.fadeOut(withDuration: 0.25)
//        let remove = SKAction.removeFromParent()
//
//        eggNode.run(SKAction.sequence([fade, remove]))
//
//        // Change pan texture
//        let changeTexture = SKAction.run {
//            self.pan.texture = SKTexture(imageNamed: "fullPan")
//        }
//
//        let pop = SKAction.sequence([
//            SKAction.scale(to: 1.08, duration: 0.1),
//            SKAction.scale(to: 1.0, duration: 0.1)
//        ])
//
//        pan.run(SKAction.sequence([changeTexture, pop]))
//    }
//    
//    
//    
//    
//}

