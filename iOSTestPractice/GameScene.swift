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
    
    
    var skull:SKNode?
    var ground:SKNode?
    
    
    override func didMove(to view: SKView) {
        
        self.skull = self.childNode(withName: "skull")
        self.ground = self.childNode(withName: "ground")
        //adding physics body around scene itself
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
    }
    
    //---------------------
    // CUSTOM FUNCTIONS
    //---------------------
    
    //function to make orange
    func makeOrange(xPosition:CGFloat, yPosition:CGFloat,throwX:CGFloat,throwY:CGFloat)
    {
        //1. creating image sprite
        let orange = SKSpriteNode(imageNamed: "Orange")
        
        //2. set initial position of orange where mouse is clicked
        orange.position.x = xPosition
        orange.position.y = yPosition
        
        //3. set physics for orange
        //dynamics and gravity are true by default
        orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width/2)
        
        //4. Add Orange to the scene
        addChild(orange)
        
        //throwing an orange to some direction by using impulse
        let throwOrange = SKAction.applyImpulse(CGVector(dx:throwX,dy:throwY), duration: 0.5)
        orange.run(throwOrange)
        
    }
    
    
    //---------------------
    // UPDATE FUNCTION
    //---------------------
    
    override func update(_ currentTime: TimeInterval) {
        
        //checking when skull collides with the ground
        if(skull!.intersects(ground!) == true)
        {
            print("SKULL HITS")
            
            let level2 = SKScene(fileNamed: "Scene2")
            level2!.scaleMode = .aspectFill
            let transition = SKTransition.flipVertical(withDuration: 2)

            self.scene?.view?.presentScene(level2!, transition: transition)
        }
        
    }
    
    //---------------------
    // TOUCH FUNCTION
    //---------------------
    
    //variable to store initial mouse position
    var mouseStratingPosition:CGPoint = CGPoint(x:0,y:0)
    
    //this function gets the posisiton of tap down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        //getting the mouse position on tap down
        let mousePosition = touches.first?.location(in: self)
        
        //checking the x position
        print(mousePosition!.x)
        
        //make orange only when user clicks on tree
        
            //first check on what sprite the use clicks
            let spriteTouched = self.atPoint(mousePosition!)
        
            //now check if the touched sprite is tree
            if(spriteTouched.name == "tree")
            {
                //getting the initial mouse position only when person taps the tree
                self.mouseStratingPosition = mousePosition!
            }
            else{
                self.mouseStratingPosition = CGPoint(x:0,y:0)
        }
        
    }
    
    //getting the mouse position on tap release
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //getting the mouse position on tap release
        let mousePosition = touches.first?.location(in: self)
        
        if(self.mouseStratingPosition.x != 0 && self.mouseStratingPosition.y != 0)
        {
            //gettin difference between strating and ending
            let diffX = mousePosition!.x - mouseStratingPosition.x
            let diffY = mousePosition!.y - mouseStratingPosition.y
        
        //make orange at mouse position and throw it in correct direction
      
        self.makeOrange(xPosition: mouseStratingPosition.x, yPosition: mouseStratingPosition.y,throwX: diffX,throwY: diffY)
    
        }}
}
