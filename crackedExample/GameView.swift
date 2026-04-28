//
//  GameView.swift
//  crackedExample
//
//  Created by Amat Addoais on 4/8/26.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .resizeFill
        scene.onExitToMenu = {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
    

}
