//
//  GameView.swift
//  crackedExample
//
//  Created by Amat Addoais on 4/8/26.
//
import SwiftData
import SwiftUI
import SpriteKit

enum GameMode: String, Hashable {
    case classic
    case zen
}

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    let mode: GameMode
        @Environment(\.modelContext) private var modelContext
        @Query var profiles: [PlayerProfile]
    var scene: SKScene {
        let scene = GameScene()
        scene.playerProfile = profiles.first ?? PlayerProfile()
        scene.gameMode = self.mode
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .resizeFill
        scene.onExitToMenu = {DispatchQueue.main.async {dismiss()}}
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
    }
    

}
