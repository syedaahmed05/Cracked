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
    
    func swipePan(_ pan: SKSpriteNode, direction: CGVector) {
        guard direction.dx < -40 else { return }
        
        pan.removeAllActions()
        
        let moveOut = SKAction.moveTo(
            x: -pan.size.width,
            duration: 0.35
        )
        
        let remove = SKAction.removeFromParent()
        let spawnNewPan = SKAction.run { [weak self] in
            self?.spawnNewPan(pan)
        }
        
        pan.run(SKAction.sequence([moveOut, remove, spawnNewPan]))
        
    }
    
    //CGPoint(
//    x: size.width + pan.size.width,
//    y: yPos
//)
    func spawnNewPan(_ pan: SKSpriteNode) {
        //let yPos = pan.size.height / 2 + 20
        pan.position = CGPoint(x: size.width * 0.05 , y: -size.height * 0.35)
        pan.texture = SKTexture(imageNamed: "emptyPan")
        //pan.name = "emptyPan"
        panIsFull = false
        
        addChild(pan)
        
        let moveIn = SKAction.moveTo(
            x: size.width * 0.05 ,
            duration: 0.35
        )
        
        pan.run(moveIn)
    }
    
    func fillPan(with eggNode: SKNode) {

        panIsFull = true

        // Fade out egg
        let fade = SKAction.fadeOut(withDuration: 0.25)
        let remove = SKAction.removeFromParent()

        eggNode.run(SKAction.sequence([fade, remove]))

        // Change pan texture
        let changeTexture = SKAction.run {
            self.pan.texture = SKTexture(imageNamed: "fullPan")
        }

        let pop = SKAction.sequence([
            SKAction.scale(to: 1.08, duration: 0.1),
            SKAction.scale(to: 1.0, duration: 0.1)
        ])

        pan.run(SKAction.sequence([changeTexture, pop]))
    }
    
    
    
    
}

