//
//  GameScene.swift
//  iOSTestPractice
//
//  Created by MacStudent on 2019-06-18.
//  Copyright © 2019 Jagtar. All rights reserved.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    
    override func didMove(to view: SKView) {
        
    }
    
    //function to make orange
    func makeOrange(xPosition:CGFloat, yPosition:CGFloat)
    {
        //1. creating image sprite
        let orange = SKSpriteNode(imageNamed: "orange")
        
        //2. set initial position of orange where mouse is clicked
        
        //3. set physics for orange
        //dynamics and gravity are true by default
        
        //4. Add Orange to the scene
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //make orange
        self.makeOrange(xPosition: <#T##CGFloat#>, yPosition: <#T##CGFloat#>)
        
        //getting the mouse location on tap
        let mousePosition = touches.first?.location(in: self)
        
        //checking the x position
        print(mousePosition!.x)
        
    }
    
}
