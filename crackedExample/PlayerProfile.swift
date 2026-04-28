//
//  PlayerProfile.swift
//  crackedExample
//
//  Created by Angela on 4/28/26.
//

//
import Foundation
import SwiftData

//TODO: creating a PlayerProfile model that will store everything we need to persist across game sessions

@Model
class PlayerProfile {
    var highscoreClassic: Int
    var highscoreZen: Int
    var totalCoins: Int
    var totalXP: Int
    var unlockedSkins: [String]
    
    
    var level: Int {
        var currentlevel = 1
        var xpRequiredForNext = 50
        var tempXP = totalXP
        
        while tempXP >= xpRequiredForNext {
            tempXP -= xpRequiredForNext
            currentlevel += 1
            xpRequiredForNext *= 50
        }
        return currentlevel
    }

    
    init(highscoreClassic: Int = 0,  highscoreZen: Int = 0, totalCoins: Int = 0, totalXP: Int = 0, unlockedSkins: [String] = ["default"]) {
        self.highscoreClassic = highscoreClassic
        self.highscoreZen = highscoreZen
        self.totalCoins = totalCoins
        self.totalXP = totalXP
        self.unlockedSkins = unlockedSkins
    }
    
    static func load() -> PlayerProfile {
        let defaults = UserDefaults.standard
        return PlayerProfile (
            highscoreClassic: defaults.integer(forKey: "highscoreClassic"),
            highscoreZen: defaults.integer(forKey: "highscoreZen"),
            totalCoins: defaults.integer(forKey: "totalCoins"),
            totalXP: defaults.integer(forKey: "totalXP"),
            unlockedSkins: defaults.stringArray(forKey: "unlockedSkins") ?? []
        )
    }
    
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(highscoreClassic, forKey: "highscoreClassic")
        defaults.set(highscoreZen, forKey: "highscoreZen")
        defaults.set(totalCoins, forKey: "totalCoins")
        defaults.set(totalXP, forKey: "totalXP")
        defaults.set(unlockedSkins, forKey: "unlockedSkins")
    }
    
    // Helper to award coins istantly during gameplay
    static func addCoins(_ amount: Int) {
        let profile = PlayerProfile.load()
        profile.totalCoins += amount
        profile.save()
    }
    
    
}

