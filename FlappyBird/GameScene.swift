//
//  GameScene.swift
//  FlappyBird
//
//  Created by Денис Бутмалай on 28.05.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroungNode: SKNode!
    var birdNode : SKSpriteNode!
    var gameOverLabel : SKLabelNode!
    override func didMove(to view: SKView) {
        backgroungNode = self.childNode(withName: "background")!
        birdNode = self.childNode(withName: "bird") as? SKSpriteNode
        gameOverLabel = self.childNode(withName: "gameoverLabel") as? SKLabelNode
        
        gameOverLabel.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        let moveBackground = SKAction.move(by: CGVector(dx: -500, dy: 0), duration: 10)
        backgroungNode.run(moveBackground)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 15000))
    }
    func stopGame(){
        backgroungNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
}
