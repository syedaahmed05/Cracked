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
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        
        let spawn = SKAction.run { [weak self] in self?.fallingFeather()}
        let delay = SKAction.wait(forDuration: 8.0, withRange: 3.0)
        let sequence = SKAction.sequence([spawn, delay])
        
        let initialDelay = SKAction.wait(forDuration: CGFloat.random(in: 0...2))
        
        run(SKAction.sequence([initialDelay, SKAction.repeatForever(sequence)]))
        

    }
    
    
    
    func fallingFeather() {
        let feather = SKSpriteNode(imageNamed: "feather")
        feather.isUserInteractionEnabled = false
        
        let centerX = size.width * 0.5
        let range: CGFloat = 100
        let xPos = CGFloat.random(in: (centerX - range)...(centerX + range))
        
        let randomScale = CGFloat.random(in: 0.5...0.9)
        feather.setScale(randomScale)
    
        feather.position = CGPoint(x: xPos, y: self.size.height + feather.size.height + 50)
        feather.zPosition = 0
        feather.name = "feather"
        
        feather.zRotation = CGFloat.random(in: 0...CGFloat.pi * 2)
        // 2. Physics Setup (The "Bounciness")
        // We use a circle body because it interacts better with screen edges
        feather.physicsBody = SKPhysicsBody(circleOfRadius: feather.size.width / 2)
        feather.physicsBody?.affectedByGravity = false // We use SKAction for falling
        feather.physicsBody?.restitution = 0.6        // Bounciness factor
        feather.physicsBody?.friction = 0
        feather.physicsBody?.linearDamping = 0.5       // Slight air resistance
        
        // 3. Movement Logic
        let fallDuration = TimeInterval.random(in: 4.0...7.0)
        
        // Horizontal Swaying (Pushing against the physics walls)
        let swayDistance = CGFloat.random(in: 40...80)
        let swayRight = SKAction.moveBy(x: swayDistance, y: 0, duration: 1.5)
        let swayLeft = SKAction.moveBy(x: -swayDistance, y: 0, duration: 1.5)
        swayRight.timingMode = .easeInEaseOut
        swayLeft.timingMode = .easeInEaseOut
        
        let swaySequence = SKAction.sequence([swayRight, swayLeft, swayLeft, swayRight])
        let repeatSway = SKAction.repeatForever(swaySequence)
        
        // Spinning
        let rotate = SKAction.rotate(byAngle: CGFloat.random(in: -3...3), duration: 2.5)
        let repeatRotate = SKAction.repeatForever(rotate)
            
        // Constant downward fall
        let moveDown = SKAction.moveTo(y: -feather.size.height - 100, duration: fallDuration)
        let remove = SKAction.removeFromParent()
            
        // 4. Execute
        feather.run(repeatSway)
        feather.run(repeatRotate)
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




//
//extension GameScene {
//    
//    func addingFeathers() {
//        let feathers = SKAction.run { [weak self] in self?.fallingFeather()}
//        let wait = SKAction.wait(forDuration: 3.0)
//        run(SKAction.repeatForever(SKAction.sequence([feathers, wait])))
//    }
//    
//    
//    
//    func fallingFeather() {
//        let feather = SKSpriteNode(imageNamed: "feather")
//        
//        feather.isUserInteractionEnabled = false
//        
//        let centerX = size.width * 0.05
//        let range: CGFloat = 120
//        
//        let xPos = CGFloat.random(in: (centerX - range)...(centerX + range))
//        
//        feather.position = CGPoint(x: xPos, y: self.size.height + feather.size.height + 50)
//        feather.zPosition = 1
//        
//        feather.name = "feather"
//        let fallDuration = TimeInterval.random(in: 4.0...7.0)
//        let moveDown = SKAction.moveTo(y: -600, duration: fallDuration)
//        let remove = SKAction.removeFromParent()
//        
//        feather.run(SKAction.sequence([moveDown, remove]))
//        
//        addChild(feather)
//    }
//    
//    func swipeFeather(_ feather: SKSpriteNode, direction: CGVector) {
//        feather.removeAllActions()
//        
//        let multiplier: CGFloat = 3.0
//        let moveVector = CGVector (
//            dx: direction.dx * multiplier,
//            dy: direction.dy * multiplier
//        )
//        
//        let move = SKAction.move(by: moveVector, duration: 0.4)
//        let fade = SKAction.fadeOut(withDuration: 0.4)
//        let group = SKAction.group([move, fade])
//        let remove = SKAction.removeFromParent()
//
//        feather.run(SKAction.sequence([group, remove]))
//    }
//    
//    
//}

