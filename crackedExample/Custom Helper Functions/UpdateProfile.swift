//
//  UpdateProfile.swift
//
//
//  Created by Amat Addoais on 4/27/26.
//

import SpriteKit
import SwiftUI

extension GameScene {
    
    func updateAndSaveState() -> PlayerProfile {
        // Load the current profile
        let profile = PlayerProfile.load()
        let finalScore = self.score
        
        // Calculate XP gained this round (score / 2)
        let xpGained = Int(score / 2)
        profile.totalXP += xpGained
        
        if gameMode == .classic {
            if finalScore > profile.highscoreClassic {
                profile.highscoreClassic = finalScore
                reportScoreToGameCenter(score: finalScore)
            }
        } else if gameMode == .zen {
            if finalScore > profile.highscoreZen {
                profile.highscoreZen = finalScore
            }
        }
        
        
        profile.save()
        print("Game Over! Total XP: \(profile.totalXP), Current Level: \(profile.level)")
        return profile
    }
    
    
    func reportScoreToGameCenter(score: Int) {
        
    }
    
}
    
