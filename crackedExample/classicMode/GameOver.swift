//  GameOver.swift
//  crackedExample
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
        
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.9), size: frame.size)
        darkenBg.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
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
        bestScoreTitle.text = "best: enter here"
        bestScoreTitle.fontSize = size.width * 0.06
        bestScoreTitle.fontColor = .customBeige
        bestScoreTitle.name = "bestScoreTitle"
        bestScoreTitle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.75)
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
        

        let coinImg = SKSpriteNode(imageNamed: "coin")
        coinImg.position = CGPoint(x: size.width * 0.2, y: size.height * 0.65)
        coinImg.size = CGSize(width: size.width * 0.08, height: size.height * 0.08)
        coinImg.zPosition = 100
        coinImg.name = "coin"
        gameOverPopUp.addChild(coinImg)
        
        let coinTitle = SKLabelNode(fontNamed: "Super Meatball")
        coinTitle.text = "27"
        coinTitle.fontSize = size.width * 0.06
        coinTitle.fontColor = .customBeige
        coinTitle.name = "coinTitle"
        coinTitle.position = CGPoint(x: size.width * 0.5, y: size.height * 0.65)
        coinTitle.zPosition = 100
        gameOverPopUp.addChild(coinTitle)
        
        let endGameChicken = SKSpriteNode(imageNamed: "endGameChicken")
        endGameChicken.position = CGPoint(x: size.width * 0.5, y: size.height * 0.45)
        endGameChicken.size = CGSize(width: size.width * 0.8, height: size.height * 0.35)
        endGameChicken.zPosition = 100
        endGameChicken.name = "endGameChicken"
        gameOverPopUp.addChild(endGameChicken)

        let menuBtn = SKSpriteNode(imageNamed: "menuBtn")
        menuBtn.size = CGSize(width: size.width * 0.70, height: size.height * 0.09)
        menuBtn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        menuBtn.name = "mainMenuBtn"
        menuBtn.zPosition = 100
        gameOverPopUp.addChild(menuBtn)
        
        let playAgainBtn = SKSpriteNode(imageNamed: "playAgainBtn")
        playAgainBtn.size = CGSize(width: size.width * 0.70, height: size.height * 0.09)
        playAgainBtn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.1)
        playAgainBtn.name = "playAgainBtn"
        playAgainBtn.zPosition = 100
        gameOverPopUp.addChild(playAgainBtn)
        
        
    }
    
    
}
