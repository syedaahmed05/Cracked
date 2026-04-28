//
//  GameProfile.swift
//  crackedExample
//
//  Created by Angela on 4/28/26.
//


import Foundation
import SwiftData

@Model
class GameProfile {
    var selectedChickenSkin: String
    var selectedEggSkin: String
    var selectedChefSkin: String
    
    init(selectedChickenSkin: String = "defaultChicken", selectedEggSkin: String = "defaultEgg", selectedChefSkin: String = "defaultChef") {
        self.selectedChickenSkin = selectedChickenSkin
        self.selectedEggSkin = selectedEggSkin
        self.selectedChefSkin = selectedChefSkin
    }
}
