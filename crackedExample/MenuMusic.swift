//
//  MenuMusic.swift
//  crackedExample
//
//  Created by Angela on 4/28/26.
//

import AVFoundation

class MenuMusic {
    static let shared = MenuMusic() //one instance can be used again thru the app, MenuMusic() is creating 1st instance
    private var musicPlayer: AVAudioPlayer?
    private var sfxPlayer: AVAudioPlayer?

    private init() {}
    func playMusic() {
        guard let url = Bundle.main.url(forResource: "crackedDoomVer", withExtension: "mp3") else {
            print("Error playing menu music...")
            return
        }

        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.numberOfLoops = -1
            musicPlayer?.volume = 0.5
            musicPlayer?.play()
        } catch {
            print("Error playing music: \(error)")
        }
    }

    
    func playSFX() {
         guard UserDefaults.standard.bool(forKey: "isSFXOn") else { return }

         guard let url = Bundle.main.url(forResource: "tapSound", withExtension: "mp3") else {
             print("Error playing sfx...")
             return
         }

         do {
             sfxPlayer = try AVAudioPlayer(contentsOf: url)
             sfxPlayer?.volume = 1.0
             sfxPlayer?.play()
         } catch {
             print("SFX error: \(error)")
         }
     }
    func stopMusic() {
        musicPlayer?.stop()
    }
    
    func stopSFX() {
        sfxPlayer?.stop()
    }

}

