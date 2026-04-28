//
//  HelperFunctions.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/27/26.
//
import SwiftUI
import SpriteKit
import AVFAudio
import GameKit
extension GameScene {
    
    //TODO: Helper function for Update Functions
    // Helper function to make the exit smooth
    func fadeAndDestroy(_ node: SKNode) {
        // Stop falling physics so it doesn't keep dropping while fading
        node.physicsBody = nil
        
        let fade = SKAction.fadeOut(withDuration: 0.15)
        let remove = SKAction.removeFromParent()
        node.run(SKAction.sequence([fade, remove]))
    }
    
    // Visual feedback for Classic Mode
    func flashPanRed() {
        let redAction = SKAction.colorize(with: .red, colorBlendFactor: 1.0, duration: 0.1)
        let resetAction = SKAction.colorize(withColorBlendFactor: 0.0, duration: 0.1)
        pan.run(SKAction.sequence([redAction, resetAction]))
    }
    //to do play again reset function
    
    func resetGameSetup() {
               // Rest game variables
               score = 0
               lives = 3
               currentPanCount = 0
               panIsFull = false
               isChefOnScreen = false
               zenTimeRemaining = 90
               zenTimerLabel.fontColor = .customRed
               
               // Clean up the scene
               musicPlayer?.stop()
               self.removeAllActions()
               self.run(SKAction.stop()) // to stop the sound effect engine
               self.removeAllChildren()
               
               // Reset the pan texture
               pan.texture = SKTexture(imageNamed: "emptyPan")
               playMusic(named: "crackedOriginalVer", volume: 1.0)
               
               gameSetup()
               
               if gameMode == .classic {
                   classicMode()
               } else if gameMode == .zen {
                   zenMode()
               }
           }
    
    
}
