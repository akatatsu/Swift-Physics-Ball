//
//  GameScene.swift
//  SwiftPhysicsBall
//
//  Created by Tatsuhiko Akashi on 2014/10/05.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        println(self.frame)
        physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
    }
    
    func createBall(position: CGPoint) -> SKShapeNode {
        
        let ball = SKShapeNode(circleOfRadius: 20.0)
        ball.fillColor = SKColor.whiteColor()
        ball.position = position
        ball.name = "ball"
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20.0)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.restitution = 0.9
        ball.physicsBody?.linearDamping = 0;
        ball.physicsBody?.friction = 0;
        
        ball.physicsBody?.velocity = CGVectorMake(CGFloat(arc4random() % 1000), CGFloat(arc4random() % 1000))
        
        return ball
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location:CGPoint = touch.locationInNode(self)
            self.addChild(self.createBall(location))
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
    }
}


