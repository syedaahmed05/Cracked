//
//  FeatherLogic.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/9/26.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    func addingFeathers() {
        let feathers = SKAction.run { [weak self] in self?.fallingFeather()}
        let wait = SKAction.wait(forDuration: 3.0)
        run(SKAction.repeatForever(SKAction.sequence([feathers, wait])))
    }
    
    
    
    func fallingFeather() {
        let feather = SKSpriteNode(imageNamed: "feather")
        
        feather.isUserInteractionEnabled = false
        
        let centerX = size.width * 0.05
        let range: CGFloat = 120
        
        let xPos = CGFloat.random(in: (centerX - range)...(centerX + range))
        
        feather.position = CGPoint(x: xPos, y: self.size.height + feather.size.height + 50)
        feather.zPosition = 1
        
        feather.name = "feather"
        let fallDuration = TimeInterval.random(in: 4.0...7.0)
        let moveDown = SKAction.moveTo(y: -600, duration: fallDuration)
        let remove = SKAction.removeFromParent()
        
        feather.run(SKAction.sequence([moveDown, remove]))
        
        addChild(feather)
    }
    
    func swipeFeather(_ feather: SKSpriteNode, direction: CGVector) {
        feather.removeAllActions()
        
        let multiplier: CGFloat = 3.0
        let moveVector = CGVector (
            dx: direction.dx * multiplier,
            dy: direction.dy * multiplier
        )
        
        let move = SKAction.move(by: moveVector, duration: 0.4)
        let fade = SKAction.fadeOut(withDuration: 0.4)
        let group = SKAction.group([move, fade])
        let remove = SKAction.removeFromParent()

        feather.run(SKAction.sequence([group, remove]))
    }
    
    
}

