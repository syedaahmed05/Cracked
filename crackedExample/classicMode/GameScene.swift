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
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    } 
    let settingsPopUp = SKSpriteNode(imageNamed:"settingsBgShape")
    let settingsMusicPopUp = SKSpriteNode(imageNamed:"settingsBgShape")
    let gameOverPopUp = SKNode()
    let pan = SKSpriteNode(imageNamed: "emptyPan")
    let scoreLabel = SKLabelNode(text: "0")
    
    var swipeStartPoint: CGPoint?
    var selectedFeather: SKSpriteNode?
    var selectedPan: SKSpriteNode?
    var isGamePaused = false
    var panIsFull = false
    
    var score = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    
    var lives = 3
    var livesLabel = SKLabelNode(text: "")
    //var isGameOVer = false
    
    
    enum SceneSelection {
        //case mainMenu
        case startGame
        //case settings
        //case settingsMusicOnly
        //case info
        case gameOver
    }
    var currentScene: SceneSelection = .startGame
    var musicPlayer: AVAudioPlayer?
    var musicVolume: Float = 1.0
    var musicSliderMinX: CGFloat = 0
    var musicSliderMaxX: CGFloat = 0

    override func didMove(to view: SKView) {
        scaleMode = .resizeFill
        settingsPopUp.isHidden = true
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        playMusic()

    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in:self )
        let node = atPoint(location)
        let nodesAtPoint = nodes(at: location)
        
        selectedFeather = nodesAtPoint.first { $0.name == "feather" } as? SKSpriteNode
        selectedPan = nodesAtPoint.first { $0.name == "pan" } as? SKSpriteNode
        swipeStartPoint = location
        
        for node in nodesAtPoint {
                    if node.name == "egg" {
                        crackEgg(node: node)
                        score += 1
                        break
                    }
                }
        
        if node.name == "playBtn" {
            print("play button tapped.")
            gameSetup()
        }
        if node.name == "playTitle"{
            print("Play button tapped.")
            gameSetup()
            
        }
        if node.name == "settingsMusicBtn" {
            print("Settings button tapped.")
            //settingsMusicOnly()
            
        }
        
        if node.name == "settingsMusicCloseBtn" {
            print("Music Settings button tapped.")
            //mainMenu()
            
            
        }
        if node.name == "settingsCloseBtn" {
            print("Settings closed.")
            gameSetup()
        }//here we need to also be able to take it back to gameplay too

        
        if node.name == "infoCloseBtn"{
            print("Info screen closed.")
            //mainMenu()
        }
        
        if node.name == "mainMenuBtn"{
            print("Menu button tapped.")
            score = 0
            lives = 3
            MainMenu()
        }
        
        if node.name == "exBtn"
        {
            gameOver()
        }
        
        if node.name == "menuBtn"{
            print("Play again button tapped.")
            score = 0
            lives = 3
            panIsFull = false
            pan.texture = SKTexture(imageNamed: "emptyPan")
            gameSetup()
        }
        
        if node.name == "pauseBtn"{
            isGamePaused = true
            //currentScene = .settings
            //settingsView()
            removeAllActions()
        }
        
        if node.name == "settingsQuitBtn"{
            isGamePaused = false
            self.isPaused = false
            removeAllActions()
            removeAllChildren()
            //currentScene = .mainMenu
            //mainMenu()
        }
        
        if node.name == "settingsQuitTitle"{
            isGamePaused = false
            self.isPaused = false
            
            removeAllActions()
            removeAllChildren()
            //currentScene = .mainMenu
            //mainMenu()
        }
        
        if node.name == "resumeBtn"{
            isGamePaused = false
            settingsPopUp.removeFromParent()
            childNode(withName: "darkenBg")?.removeFromParent()
            currentScene = .startGame
            gameSetup()
            
        }
    }
        

    override func didChangeSize(_ oldSize: CGSize) {
        //removeAllChildren()
        if let darkenBg = childNode(withName: "darkenBg") as? SKSpriteNode {
               darkenBg.size = CGSize(width: size.width, height: size.height)
               darkenBg.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
           }

           settingsPopUp.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)

           if let musicSliderBg = settingsPopUp.childNode(withName: "musicSliderBg") as? SKSpriteNode {
               musicSliderBg.position = CGPoint(x: 0, y: -settingsPopUp.size.height * 0.25)
               musicSliderMinX = musicSliderBg.position.x - 200 / 2
               musicSliderMaxX = musicSliderBg.position.x + 200 / 2
           }

           if let musicSlider = settingsPopUp.childNode(withName: "musicSlider") as? SKSpriteNode {
               musicSlider.position.x = musicSliderMinX + CGFloat(musicVolume) * 200
               musicSlider.position.y = -settingsPopUp.size.height * 0.25
           }
        
        switch currentScene{
        case .startGame:
            gameSetup()
            
        //case .settings:
            //showPopup()
            //settingsView()
            
       // case .settingsMusicOnly:
            //showPopup()
            //settingsMusicOnly()
            
        case .gameOver:
            MainMenu()
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        //let location = touch.location(in: settingsMusicPopUp)
//        let node = settingsMusicPopUp.atPoint(location)
//
//        if node.name == "musicSlider" {
//                updateSlider(locationX: location.x)
//            }

    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            guard
                let touch = touches.first,
                let start = swipeStartPoint
            else { return }
            
            let end = touch.location(in: self)
            
            let dx = end.x - start.x
            let dy = end.y - start.y
            let swipeDirection = hypot(dx, dy)
            
            guard swipeDirection > 30 else { return }
            
            let direction = CGVector(dx: dx, dy: dy)
            
           // detect which object was swiped
            if let feather = selectedFeather {
                swipeFeather(feather, direction: direction)
            }
            
            if let pan = selectedPan {
                swipePan(pan, direction: direction)
            }
        
            swipeStartPoint = nil
            selectedFeather = nil
            selectedPan = nil
            
        }
    

    
    func playMusic() {
        guard let url = Bundle.main.url(forResource: "crackedOriginalVer", withExtension: "mp3") else { return }
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.numberOfLoops = -1
            musicPlayer?.volume = musicVolume
            
            musicPlayer?.play()
        } catch {
            print("Music not playing.")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered self.pan.position.y
        let bottomLimit = CGFloat(-350)
        //guard !panIsFull else { return }
        
        if currentScene == .gameOver { return }
        
        enumerateChildNodes(withName: "liquidEgg") { node, _ in
            if node.position.y <= bottomLimit {
                node.removeFromParent()
                self.fillPan(with: node)
                
            }
        }
        
        enumerateChildNodes(withName: "egg") { node, _ in
            if node.position.y <=  bottomLimit {
                node.removeFromParent()
                self.loseLife()
            }
        }
        
        enumerateChildNodes(withName: "feather") { node, _ in
            if node.position.y <= bottomLimit {
                node.removeFromParent()
                self.loseLife()
            }
        }
    }
}
