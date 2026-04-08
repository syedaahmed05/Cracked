//
//  StartGame.swift
//  crackedExample
//
//  Created by Amat Addoais on 2/9/26.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    
    func gameSetup() {
        currentScene = .startGame
        removeAllChildren()
        // adding a backgound on the -1 layer
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.blendMode = .replace
        background.size = self.size
        background.zPosition = -1   //LOWEST LAYER
        addChild(background)
        
        //add the chicken butt to the scene
        let chicken = SKSpriteNode(imageNamed: "wholeChicken")
        chicken.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        chicken.zPosition = 2
        addChild(chicken)
        
        //add the pan to the scene
        pan.position = CGPoint(x: size.width * 0.05 , y: -size.height * 0.35)
        pan.zPosition = 1
        pan.name = "pan"
        addChild(pan)
        
        let pauseBtn = SKSpriteNode(imageNamed: "pauseBtn")
        pauseBtn.name = "pauseBtn"
        pauseBtn.size = CGSize(width: size.width * 0.04, height: size.height * 0.04)
        pauseBtn.position = CGPoint(x:size.width  * 0.45,y: size.height * 0.45)
        pauseBtn.zPosition = 5
        addChild(pauseBtn)

        let eggScorePhoto = SKSpriteNode(imageNamed: "egg")
        eggScorePhoto.size = CGSize(width: size.width * 0.01, height: size.height * 0.01)
        eggScorePhoto.position = CGPoint(x: -size.width * 0.35, y: -size.height * 0.1)
        eggScorePhoto.zPosition = -1
        addChild(eggScorePhoto)
        
        scoreLabel.position = CGPoint(x: eggScorePhoto.position.x * 0.70, y: -size.height * 0.45)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = size.height * 0.055
        scoreLabel.fontName = "Super Meatball"
        scoreLabel.fontColor = .customRed
        addChild(scoreLabel)
        
        livesLabel = SKLabelNode(fontNamed: "Super Meatball")
        livesLabel.fontSize = size.height * 0.045
        livesLabel.fontColor = .customRed
        livesLabel.position = CGPoint(x:-eggScorePhoto.position.x * 0.50, y: -size.height * 0.45 )
        livesLabel.zPosition = 100
        livesLabel.text = "❌❌❌\(lives)"
        addChild(livesLabel)
        
        addingEggs()
        addingFeathers()
    }
    
    func loseLife() {
        lives -= 1
        animateLifeLoss()
        print("Lost a life")
        livesLabel.text = "❌ \(lives)"
        
        if lives == 3 {
            livesLabel.text = "❌❌❌ \(lives)"
        } else if lives == 2 {
            livesLabel.text = "❌❌ \(lives)"
        } else if lives == 1 {
            livesLabel.text = "❌ \(lives)"
        }

        if lives <= 0 {
            gameOver()
        }
    }
    
    func animateLifeLoss() {
        let shake = SKAction.sequence([
            SKAction.scale(to: 1.3, duration: 0.1),
            SKAction.scale(to: 1.0, duration: 0.1)
        ])

        livesLabel.run(shake)
    }

    func fadeAndRemove(_ node: SKNode) {

        let fade = SKAction.fadeOut(withDuration: 0.3)
        let remove = SKAction.removeFromParent()

        node.run(SKAction.sequence([fade, remove]))
    }
}

