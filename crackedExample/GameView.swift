//
//  GameView.swift
//  crackedExample
//
//  Created by Angela on 4/6/26.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

