//
//  GameOver.swift
//  crackedExample
//
//  Created by Angela on 2/9/26.
//
import Foundation
import SpriteKit
import UIKit
import SwiftUI

extension GameScene{
    var scoreTitle: SKLabelNode? {
        get { return childNode(withName: "scoreTitle") as? SKLabelNode }
        set {
            if let newValue = newValue {
                newValue.name = "scoreTitle"
                gameOverPopUp.addChild(newValue)
            }
        }
    }
    
    func gameOver(){
        currentScene = .gameOver
        //removeAllChildren()
        removeAllActions()
        
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: frame.size)
        darkenBg.position = CGPoint(x: size.width * 0.5, y: size.width * 1.1)
        darkenBg.zPosition = 99
        darkenBg.size = self.size
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        if gameOverPopUp.parent == nil {addChild(gameOverPopUp)}
        gameOverPopUp.removeAllChildren()
        
        let scoreTitle = SKLabelNode(fontNamed: "Super Meatball")
        scoreTitle.text = "Score: \(score)"
        scoreTitle.fontSize = size.width * 0.12
        scoreTitle.fontColor = .white
        scoreTitle.name = "scoreTitle"
        scoreTitle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        scoreTitle.zPosition = 100
        gameOverPopUp.addChild(scoreTitle)
        
        let gameOverText = SKLabelNode(fontNamed: "Boba Milky")
        gameOverText.text = "You've fried your last egg!"
        gameOverText.fontColor = .customOrange
        gameOverText.fontSize = size.width * 0.06
        gameOverText.position = CGPoint(x: size.width * 0.5, y: size.height * 0.88)
        gameOverText.zPosition = 100
        gameOverText.name = "gameOverText"
        gameOverPopUp.addChild(gameOverText)
        
        
        let endGameChicken = SKSpriteNode(imageNamed: "endGameChicken")
        endGameChicken.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        endGameChicken.size = CGSize(width: size.width * 0.8, height: size.height * 0.35)
        endGameChicken.zPosition = 100
        endGameChicken.name = "endGameChicken"
        gameOverPopUp.addChild(endGameChicken)

        let menuBtn = SKSpriteNode(imageNamed: "menuBtn")
        menuBtn.size = CGSize(width: size.width * 0.65, height: size.height * 0.08)
        menuBtn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
        menuBtn.name = "menuBtn"
        menuBtn.zPosition = 100
        gameOverPopUp.addChild(menuBtn)
        
        let playAgainBtn = SKSpriteNode(imageNamed: "playAgainBtn")
        playAgainBtn.size = CGSize(width: size.width * 0.65, height: size.height * 0.08)
        playAgainBtn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        playAgainBtn.name = "playAgainBtn"
        playAgainBtn.zPosition = 100
        gameOverPopUp.addChild(playAgainBtn)
        
        
    }
    
    
}
