
import SwiftUI
import SpriteKit
import GameKit


extension GameScene {
    
    // Takes a string for the file name and also adjusts the volume
    func playMusic(named filename: String, volume: Float = 1.0) {
        // Stop the previous track so they don't overlap
        musicPlayer?.stop()
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else {
            print("Music file \(filename) not found")
            return
        }
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.numberOfLoops = -1
            
            // Calculate final volume: Global Setting * Mode Specific Volume
            musicPlayer?.volume = self.musicVolume * volume
            
            musicPlayer?.prepareToPlay()
            musicPlayer?.play()
        } catch {
            print("Could not play music: \(error.localizedDescription)")
        }
    }

}

