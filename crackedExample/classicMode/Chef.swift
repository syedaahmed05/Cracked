//
//  Chef.swift
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
    
    
    func callChef() {
        // To prevent having multiple chefs on the screen
        guard !isChefOnScreen else { return }
        isChefOnScreen = true
        
        let chef = SKSpriteNode(imageNamed: "angryChef")
        
        // Position the chef off-screen to the left
        let offScreenX = -chef.size.width
        let onScreenX = chef.size.width * 0.5
        let centerY = pan.size.height
        
        chef.position = CGPoint(x: offScreenX, y: centerY)
        chef.zPosition = 10
        addChild(chef)
        
        // Adding the action to the chef
        let moveIn = SKAction.moveTo(x: onScreenX, duration: 0.3)
        moveIn.timingMode = .easeOut
        
        let playAngrySound : SKAction
        
        if lives == 1 {
            playAngrySound = volumeSoundAction(named: "chefGrumblingLongSFX", volume: 1)
            
        } else {
            playAngrySound = volumeSoundAction(named: "chefGruntSFX", volume: 1)
        }
        
        let wait = SKAction.wait(forDuration: 2.0)
        
        let moveOut = SKAction.moveTo(x: offScreenX, duration: 0.3)
        moveOut.timingMode = .easeIn
        
        // Lower the music volume when chef enters
        let dipVolume = SKAction.run { [weak self] in
            // Fades music down to 15% of its current setting over 0.2 seconds
            self?.musicPlayer?.setVolume((self?.musicVolume ?? 1.0) * 0.10, fadeDuration: 0.4)
        }

        // Restore the music volume when chef leaves
        let restoreVolume = SKAction.run { [weak self] in
            // Fades music back to its original setting over 0.5 seconds
            self?.musicPlayer?.setVolume(self?.musicVolume ?? 1.0, fadeDuration: 0.7)
        }
        
        // Resetting the flag to a new chef that can be called later
        let resetChefFlag = SKAction.run { [weak self] in
                self?.isChefOnScreen = false
            }
        
        let remove = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([
            dipVolume, //Music goes quiet
            SKAction.group([moveIn, playAngrySound]),
            wait,
            moveOut,
            restoreVolume, // Music comes back
            resetChefFlag,
            remove
        ])
        
        chef.run(sequence)
    }
    
}


