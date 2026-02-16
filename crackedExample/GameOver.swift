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
    
    func gameOver(){
        currentScene = .gameOver
        let darkenBg = SKSpriteNode(color:UIColor.black.withAlphaComponent(0.5), size: frame.size)
        darkenBg.position = CGPoint(x: size.width * 0.0, y: size.width * 0.0)
        darkenBg.zPosition = 99
        darkenBg.name = "darkenBg"
        addChild(darkenBg)
        
        if gameOverPopUp.parent == nil {addChild(gameOverPopUp)}
        
        let scoreTitle = SKLabelNode(fontNamed: "Super Meatball")
        scoreTitle.text = "Score: "
        scoreTitle.fontSize = 100
        scoreTitle.fontColor = .white
        scoreTitle.name = "scoreTitle"
        scoreTitle.position = CGPoint(x: 0, y: 400)
        scoreTitle.zPosition = 100
        gameOverPopUp.addChild(scoreTitle)
        
        let gameOverText = SKLabelNode(fontNamed: "Boba Milky")
        gameOverText.text = "You've fried your last egg!"
        gameOverText.fontColor = .customOrange
        gameOverText.fontSize = 50
        gameOverText.position = CGPoint(x: 0, y: 300)
        gameOverText.zPosition = 100
        gameOverText.name = "gameOverText"
        gameOverPopUp.addChild(gameOverText)
        
        
        let endGameChicken = SKSpriteNode(imageNamed: "endGameChicken")
        endGameChicken.position = CGPoint(x: -120, y: frame.midY)
        endGameChicken.zPosition = 100
        endGameChicken.name = "endGameChicken"
        gameOverPopUp.addChild(endGameChicken)
        
        let homeBtn = SKSpriteNode(imageNamed: "homeBtn")
        homeBtn.size = CGSize(width: 450, height: 100)
        homeBtn.position = CGPoint(x: 0, y: -300)
        homeBtn.name = "homeBtn"
        homeBtn.zPosition = 100
        gameOverPopUp.addChild(homeBtn)
        
        let replayBtn = SKSpriteNode(imageNamed: "replayBtn")
        replayBtn.size = CGSize(width: 100, height: 100)
        replayBtn.position = CGPoint(x: 0, y: -430)
        replayBtn.name = "replayBtn"
        replayBtn.zPosition = 100
        gameOverPopUp.addChild(replayBtn)
        
        let playAgainTitle = SKLabelNode(fontNamed: "Boba Milky")
        playAgainTitle.text = "Play Again"
        playAgainTitle.name = "playAgainTitle"
        playAgainTitle.fontSize = 40
        playAgainTitle.fontColor = .white
        playAgainTitle.position = CGPoint(x: 0, y: -550)
        playAgainTitle.zPosition = 100
        gameOverPopUp.addChild(playAgainTitle)
        
        
    }
    
    
}
