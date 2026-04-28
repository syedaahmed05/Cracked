//
//  SoundEffects\.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/27/26.
//

import SpriteKit
import GameKit


extension GameScene {
    
    // Takes a string for the file name and also adjusts the volume
    func playSound(_ file: String, volume: Float = 1.0) {
        let soundAction = SKAction.playSoundFileNamed(file, waitForCompletion: false)
        let volumeAction = SKAction.changeVolume(to: volume, duration: 0)
        let group = SKAction.group([soundAction, volumeAction])
        run(group)
    }
    
    // Return a SKAction for the chef sound effects to use it in a seqence of actions
    func volumeSoundAction(named: String, volume: Float) -> SKAction {
        let sound = SKAction.playSoundFileNamed(named, waitForCompletion: false)
        let volumeAdjustment = SKAction.changeVolume(to: volume, duration: 0)
        return SKAction.group([sound, volumeAdjustment])
    }
    
}

