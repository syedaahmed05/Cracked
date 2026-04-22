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
    
    func createCombinedNode(imageName: String, text: String) -> SKNode {
        let container = SKNode()

    
        let coin = SKSpriteNode(imageNamed: "coin")
        coin.position = CGPoint(x: -50, y: 0)
        container.addChild(coin)


        let label = SKLabelNode(fontNamed: "Super Meatball")
        label.text = text
        label.fontSize = 24
        label.position = CGPoint(x: 20, y: -10)
        label.horizontalAlignmentMode = .left
        container.addChild(label)

        return container
    }
    
    func gameOver(){
        currentScene = .gameOver
        //removeAllChildren()
        removeAllActions()
        
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.9), size: frame.size)
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
        scoreTitle.fontColor = .customBeige
        scoreTitle.name = "scoreTitle"
        scoreTitle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        scoreTitle.zPosition = 100
        gameOverPopUp.addChild(scoreTitle)
        
        let bestScoreTitle = SKLabelNode(fontNamed: "Super Meatball")
        bestScoreTitle.text = "best: ENTER HERE"
        bestScoreTitle.fontSize = size.width * 0.12
        bestScoreTitle.fontColor = .customBeige
        bestScoreTitle.name = "bestScoreTitle"
        bestScoreTitle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.8)
        bestScoreTitle.zPosition = 100
        gameOverPopUp.addChild(bestScoreTitle)
        
        
        let gameOverText = SKLabelNode(fontNamed: "Boba Milky")
        gameOverText.text = "You've fried your last egg!"
        gameOverText.fontColor = .customBeige
        gameOverText.fontSize = size.width * 0.06
        gameOverText.position = CGPoint(x: size.width * 0.5, y: size.height * 0.88)
        gameOverText.zPosition = 100
        gameOverText.name = "gameOverText"
        gameOverPopUp.addChild(gameOverText)
        
        //put coin here
        let combinedNode = createCombinedNode(imageName: "coin.png", text: "33")
        combinedNode.zPosition = 100
        combinedNode.position = CGPoint(x: -size.width * 0.5, y: size.height * 0.5)
        addChild(combinedNode)
        
        
        let endGameChicken = SKSpriteNode(imageNamed: "endGameChicken")
        endGameChicken.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        endGameChicken.size = CGSize(width: size.width * 0.8, height: size.height * 0.35)
        endGameChicken.zPosition = 100
        endGameChicken.name = "endGameChicken"
        gameOverPopUp.addChild(endGameChicken)

        let menuBtn = SKSpriteNode(imageNamed: "menuBtn")
        menuBtn.size = CGSize(width: size.width * 0.65, height: size.height * 0.08)
        menuBtn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
        menuBtn.name = "mainMenuBtn"
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
