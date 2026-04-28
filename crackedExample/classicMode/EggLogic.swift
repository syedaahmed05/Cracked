//
//  EggLogic.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/9/26.
//

import Foundation
import SpriteKit
import GameplayKit


extension GameScene {
    
    struct EggTextures {
        static let normal = SKTexture(imageNamed: "egg")
        static let cracked = SKTexture(imageNamed: "crackedEgg")
        static let liquid = SKTexture(imageNamed: "liquidEgg")
        static let shellL = SKTexture(imageNamed: "leftShell")
        static let shellR = SKTexture(imageNamed: "rightShell")
    }
    
    func addingEggs() {
        let spawn = SKAction.run { [weak self] in
            self?.spawnEgg()
        }
        let wait = SKAction.wait(forDuration: 2.0)
        let sequence = SKAction.sequence([wait, spawn])
        run(SKAction.repeatForever(sequence), withKey: "eggSpawningLoop")
    }
    
    
    func spawnEgg() {
        let egg = SKSpriteNode(imageNamed: "egg")
        
        let centerX = size.width * 0.5
        let range: CGFloat = 100       // how wide the spawn area is (pixels)

        let xPos = CGFloat.random(in: (centerX - range)...(centerX + range))

        egg.position = CGPoint(x: xPos, y: self.size.height + egg.size.height + 0.50)
        egg.zPosition = 0
        egg.name = "egg"
        
        //falling action
        let fallDuration = TimeInterval.random(in: minFallDuration...maxFallDuration)
        let moveDown = SKAction.moveTo(y: -600, duration: fallDuration)
        let remove = SKAction.removeFromParent()
        
        egg.run(SKAction.sequence([moveDown, remove]))
        
        addChild(egg)
    }
    
    func updateDifficulty() {
        // Decreasing spawn interval (Minimum 0.5 seconds)
        // Formula: Start at 2.0, subtract 0.1 for every 5 points
        let newInterval = max(0.5, 2.0 - (Double(score / 5) * 0.1))
        
        // Only restart the timer if the interval actually changed
        if newInterval != currentSpawnInterval {
            currentSpawnInterval = newInterval
            restartSpawning()
        }
        
        // Making eggs fall faster (Minimum 1.5s - 2.5s duration)
        minFallDuration = max(1.5, 3.0 - (Double(score / 10) * 0.2))
        maxFallDuration = max(2.5, 6.0 - (Double(score / 10) * 0.4))
    }
    
    func restartSpawning() {
        // Remove the old loop using the key we created earlier
        removeAction(forKey: "eggSpawningLoop")
        
        // Start a new loop with the updated interval
        let spawn = SKAction.run { [weak self] in
            self?.spawnEgg()
        }
        let wait = SKAction.wait(forDuration: currentSpawnInterval)
        let sequence = SKAction.sequence([wait, spawn])
        
        run(SKAction.repeatForever(sequence), withKey: "eggSpawningLoop")
    }
    

    
    func crackEgg(node: SKNode) {
        guard let egg = node as? SKSpriteNode else { return }
        
        if egg.userData?["isCracked"] as? Bool == true { return }
        egg.userData = ["isCracked": true]
        
        egg.removeAllActions()
        
        // Optional cracked texturef
        let crack = SKTexture(imageNamed: "crackedEgg")
        let showCrack = SKAction.setTexture(crack)
        let wait = SKAction.wait(forDuration: 0.12)
        
        let spawnLiquidEggAction = SKAction.run {
            self.spawnLiquidEgg(from: egg)
        }
        
        let spawnShellsAction = SKAction.run {
            self.spawnShells(from: egg)
        }
        
        let removeEgg = SKAction.removeFromParent()
        
        egg.run(SKAction.sequence([
            showCrack,
            wait,
            spawnLiquidEggAction,
            wait,
            spawnShellsAction,
            removeEgg
        ]))
    }
    
    func spawnLiquidEgg(from egg: SKSpriteNode) {
        guard let scene = egg.scene else { return }
        let liquid = SKSpriteNode(texture: EggTextures.liquid)
        liquid.position = egg.position
        liquid.name = "liquidEgg"
        liquid.zPosition = egg.zPosition - 1
        liquid.setScale(0.6)

        liquid.physicsBody = SKPhysicsBody(circleOfRadius: liquid.size.width / 2)
        liquid.physicsBody?.affectedByGravity = true
        
        let verticalSpeed: CGFloat = -800 / CGFloat(minFallDuration)
        liquid.physicsBody?.velocity = CGVector(dx: 0, dy: verticalSpeed)
        
        let fade = SKAction.fadeOut(withDuration: 1.0)
        liquid.run(SKAction.sequence([.wait(forDuration: 1.0), fade, .removeFromParent()]))
        
        scene.addChild(liquid)
        
    }
    
    func spawnShells(from egg: SKSpriteNode) {
        guard let scene = egg.scene else { return }

        let leftShell = SKSpriteNode(imageNamed: "leftShell")
        let rightShell = SKSpriteNode(imageNamed: "rightShell")
        
        let shellSize = size.width * 0.12
        leftShell.size = CGSize(width: shellSize, height: shellSize*1.3)
        rightShell.size = CGSize(width: shellSize, height: shellSize*1.3)


        
        leftShell.position = egg.position
        rightShell.position = egg.position

        leftShell.zPosition = egg.zPosition + 1
        rightShell.zPosition = egg.zPosition + 1

        scene.addChild(leftShell)
        scene.addChild(rightShell)

        let leftMove = SKAction.moveBy(x: -40, y: -20, duration: 0.4)
        let rightMove = SKAction.moveBy(x: 40, y: -20, duration: 0.4)

        let rotateLeft = SKAction.rotate(byAngle: -.pi / 4, duration: 0.4)
        let rotateRight = SKAction.rotate(byAngle: .pi / 4, duration: 0.4)

        let fade = SKAction.fadeOut(withDuration: 0.4)
        let remove = SKAction.removeFromParent()

        leftShell.run(SKAction.sequence([
            SKAction.group([leftMove, rotateLeft, fade]),
            remove
        ]))

        rightShell.run(SKAction.sequence([
            SKAction.group([rightMove, rotateRight, fade]),
            remove
        ]))
    }
}


//extension GameScene {
//    
//    func addingEggs() {
//        let spawn = SKAction.run { [weak self] in
//            self?.spawnEgg()
//        }
//        let wait = SKAction.wait(forDuration: 1)
//        run(SKAction.repeatForever(SKAction.sequence([wait, spawn])))
//    }
//    
//    
//    func spawnEgg() {
//        let egg = SKSpriteNode(imageNamed: "egg")
//        
//        let centerX = size.width * 0.05
//        let range: CGFloat = 100       // how wide the spawn area is (pixels)
//
//        let xPos = CGFloat.random(in: (centerX - range)...(centerX + range))
//
//        egg.position = CGPoint(x: xPos, y: self.size.height + egg.size.height + 0.50)
//        egg.zPosition = 0
//        egg.name = "egg"
//        
//        //falling action
//        let fallDuration = TimeInterval.random(in: 4.0...7.0)
//        let moveDown = SKAction.moveTo(y: -600, duration: fallDuration)
//        let remove = SKAction.removeFromParent()
//        
//        egg.run(SKAction.sequence([moveDown, remove]))
//        
//        addChild(egg)
//    }
//    
//
//    
//    func crackEgg(node: SKNode) {
//        guard let egg = node as? SKSpriteNode else { return }
//        
//        if egg.userData?["isCracked"] as? Bool == true { return }
//        egg.userData = ["isCracked": true]
//        
//        egg.removeAllActions()
//        
//        // Optional cracked texturef
//        let crack = SKTexture(imageNamed: "crackedEgg")
//        let showCrack = SKAction.setTexture(crack)
//        let wait = SKAction.wait(forDuration: 0.12)
//        
//        let spawnLiquidEggAction = SKAction.run {
//            self.spawnLiquidEgg(from: egg)
//        }
//        
//        let spawnShellsAction = SKAction.run {
//            self.spawnShells(from: egg)
//        }
//        
//        let removeEgg = SKAction.removeFromParent()
//        
//        egg.run(SKAction.sequence([
//            showCrack,
//            wait,
//            spawnLiquidEggAction,
//            wait,
//            spawnShellsAction,
//            removeEgg
//        ]))
//    }
//    
//    func spawnLiquidEgg(from egg: SKSpriteNode) {
//        guard let scene = egg.scene else { return }
//        let liquid = SKSpriteNode(imageNamed: "liquidEgg")
//        liquid.position = egg.position
//        liquid.name = "liquidEgg"
//        liquid.zPosition = egg.zPosition - 1
//        liquid.setScale(0.6)
//
//        liquid.physicsBody = SKPhysicsBody(circleOfRadius: liquid.size.width / 2)
//        liquid.physicsBody?.affectedByGravity = true
//        liquid.physicsBody?.allowsRotation = true
//        liquid.physicsBody?.restitution = 0.2
//        liquid.physicsBody?.linearDamping = 0.3
//        
//        let wait = SKAction.wait(forDuration: 2.0)
//        let remove = SKAction.removeFromParent()
//        liquid.run(SKAction.sequence([wait, remove]))
//        
//        scene.addChild(liquid)
//        
//    }
//    
//    func spawnShells(from egg: SKSpriteNode) {
//        guard let scene = egg.scene else { return }
//
//        let leftShell = SKSpriteNode(imageNamed: "leftShell")
//        let rightShell = SKSpriteNode(imageNamed: "rightShell")
//
//        leftShell.position = egg.position
//        rightShell.position = egg.position
//
//        leftShell.zPosition = egg.zPosition + 1
//        rightShell.zPosition = egg.zPosition + 1
//
//        scene.addChild(leftShell)
//        scene.addChild(rightShell)
//
//        let leftMove = SKAction.moveBy(x: -40, y: -20, duration: 0.4)
//        let rightMove = SKAction.moveBy(x: 40, y: -20, duration: 0.4)
//
//        let rotateLeft = SKAction.rotate(byAngle: -.pi / 4, duration: 0.4)
//        let rotateRight = SKAction.rotate(byAngle: .pi / 4, duration: 0.4)
//
//        let fade = SKAction.fadeOut(withDuration: 0.4)
//        let remove = SKAction.removeFromParent()
//
//        leftShell.run(SKAction.sequence([
//            SKAction.group([leftMove, rotateLeft, fade]),
//            remove
//        ]))
//
//        rightShell.run(SKAction.sequence([
//            SKAction.group([rightMove, rotateRight, fade]),
//            remove
//        ]))
//    }
//}
