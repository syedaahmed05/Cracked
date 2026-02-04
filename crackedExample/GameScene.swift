//
//  GameScene.swift
//  crackedExample
//
//  Created by Angela Carrillo goomba on 1/28/26.
//

import SpriteKit
import GameplayKit
import SwiftUI
import UIKit
import AVFoundation
import Foundation

class GameScene: SKScene {
    
   //var gameTitle: SKLabelNode!
    
    enum SceneSelection {
        case mainMenu
        case startGame
       // case settings
        case info
    }
    var currentScene: SceneSelection = .mainMenu
    
    override func didMove(to view: SKView) {
        scaleMode = .resizeFill
        mainMenu()
    
        
    }
    
    
    
    func startGame() {
        currentScene = .startGame
        removeAllChildren()
        backgroundColor = .customBeige
        
        let startTitle = SKLabelNode(text: "start game example")
        startTitle.fontColor = .customRed
        addChild(startTitle)
        
        }
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in:self )
        let node = atPoint(location)
        let nodesAtPoint = nodes(at: location)
        
//        for node in nodesAtPoint{
//            if node.name == "egg"{
//                crackEgg(node: node)
//                break
//            }
//        }
        
        if node.name == "playBtn" {
            print("play button tapped.")
            startGame()
        }
        if node.name == "Play"{
            print("Play button tapped.")
            startGame()
            
        }
        if node.name == "settingsBtn" {
            print("Settings butotn tapped.")
        }
        
        if node.name == "infoBtn"{
            print("Info button tapped.")
            info()
        }
        
        if node.name == "infoCloseBtn"{
            print("Info screen closed.")
            mainMenu()
        }
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        removeAllChildren()
        
        switch currentScene{
        case .mainMenu:
            mainMenu()
        case .startGame:
            startGame()
        case .info:
            info()
        }
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
