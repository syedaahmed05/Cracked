//
//
//  TimerLogic.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/27/26.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    func updateTimerText() {
        let minutes = zenTimeRemaining / 60
        let seconds = zenTimeRemaining % 60
        zenTimerLabel.text = String(format: "%d:%02d", minutes, seconds)
    }
    
    func startZenTimer() {
        // Define the wait for 1 second
        let wait = SKAction.wait(forDuration: 1.0)
        
        // Define the countdown logic
        let countDown = SKAction.run { [weak self] in
            guard let self = self else { return }
            
            if self.zenTimeRemaining > 0 {
                self.zenTimeRemaining -= 1
                self.updateTimerText()
                
                // Make it pulse red when under 10 seconds
                if self.zenTimeRemaining <= 10 {
                    self.zenTimerLabel.fontColor = .green
                    let pulse = SKAction.sequence([
                        SKAction.scale(to: 1.5, duration: 0.2),
                        SKAction.scale(to: 1.0, duration: 0.1)
                    ])
                    self.zenTimerLabel.run(pulse)
                }
            } else {
                // Timer Hit Zero
                self.zenTimerLabel.removeAllActions()
                self.gameOver()
            }
        }
        // Repeat forever (or until timer hits zero and we stop it)
        let sequence = SKAction.sequence([wait, countDown])
        zenTimerLabel.run(SKAction.repeatForever(sequence))
    }
    
}
