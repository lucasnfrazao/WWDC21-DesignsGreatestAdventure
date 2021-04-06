/*:
 ![StartBanner](StartBasics.png)
 
 Today, we're going to talk about **user interfaces**. Designing well-thought-out user interfaces, or UI for short, is a very important step on the making of great and accessible experiences for **everyone**!
 
 Although it's consider a very complex subject, there are some concepts that we can use in order to achieve better results when projecting our apps.

 According to Usability.gov, every project should follow some best practices for its interface development.

 Here, we are going to explore three of them:

 - Simplicity
 - Consistency
 - Purpose

 To start our journey into the world of UI design, you will need to help Lucas with his new side project: his grandma just got a new iPhone and she's super excited to explore everything she can possibly do with it.

 Your goal here will be to complete three challenges to help Lucas' grandma enter the **Great World of Design**!

 Tap **Run My Code** to help her!

 When you're ready, go to the **next page** to continue grandma's adventure.
 
*/
//#-hidden-code

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    private let kAnimalNodeName = "movable"
    private var selectedNode = SKSpriteNode()
    
    var nextButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.93, green: 0.83, blue: 0.62, alpha: 1.0)
       
        // Get label node from scene and store it for use later
        //label = childNode(withName: "//helloLabel") as? SKLabelNode
//        label.alpha = 0.0
//        let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 2.0),
//                                           .fadeOut(withDuration: 2.0)])
//        label.run(.repeatForever(fadeInOut))
//        
//        // Create shape node to use during mouse interaction
//        let w = (size.width + size.height) * 0.05
//        
//        spinnyNode = SKShapeNode(rectOf: CGSize(width: w, height: w), cornerRadius: w * 0.3)
//        spinnyNode.lineWidth = 2.5
//        
//        let fadeAndRemove = SKAction.sequence([.wait(forDuration: 0.5),
//                                               .fadeOut(withDuration: 0.5),
//                                               .removeFromParent()])
//        spinnyNode.run(.repeatForever(.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//        spinnyNode.run(fadeAndRemove)
        
        nextButton = childNode(withName: "//next") as? SKSpriteNode
        
        nextButton.isHidden = true
        
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //guard let n = spinnyNode.copy() as? SKShapeNode else { return }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        //guard let n = self.spinnyNode.copy() as? SKShapeNode else { return }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        //guard let n = spinnyNode.copy() as? SKShapeNode else { return }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)

        selectNodeForTouch(touchLocation: touchLocation)
        
        nextButton.isHidden = false
        
        if nextButton.contains(touchLocation) {
            
            if let scene = SecondScene(fileNamed: "SecondScene") {
            
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                sceneView.presentScene(scene)
                
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
            for t in touches {

                let location = t.location(in: self)

                //if !location.isOutside(box.frame) {
                
                    selectedNode.position.x = location.x
                    selectedNode.position.y = location.y

                //}
                    
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }

    func selectNodeForTouch(touchLocation: CGPoint) {
      // 1
        let touchedNode = self.atPoint(touchLocation)
      
      if touchedNode is SKSpriteNode {
        // 2
        if !selectedNode.isEqual(touchedNode) {
          selectedNode.removeAllActions()
            selectedNode.run(SKAction.rotate(toAngle: 0.0, duration: 0.1))
      
          selectedNode = touchedNode as! SKSpriteNode

          // 3
          if touchedNode.name! == kAnimalNodeName {
            let sequence = SKAction.sequence([SKAction.rotate(byAngle: degToRad(degree: -4.0), duration: 0.1),
                                              SKAction.rotate(byAngle: 0.0, duration: 0.1),
                                              SKAction.rotate(byAngle: degToRad(degree: 4.0), duration: 0.1)])
            selectedNode.run(SKAction.repeatForever(sequence))
          }
        }
      }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //autoLayout()
        
    }
    
    func autoLayout() {
        
        
        do {
            let originalSize = CGSize(width: 768, height: 1024)
                
                let originalAspect = originalSize.width/originalSize.height
                let winSize = self.view!.frame.size
                let winAspect = winSize.width/winSize.height
                var newSize = originalSize; do {
                    if winAspect > originalAspect {
                        newSize.width = originalSize.height * winAspect
                    } else if winAspect < originalAspect {
                        newSize.height = originalSize.width / winAspect
                    }
                }
            
                self.size = newSize
                self.scaleMode = .aspectFit
            }
        }
        
    
    
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    // Present the scene
    sceneView.presentScene(scene)
}

extension CGPoint {
   
    func isOutside(_ other:CGRect)->Bool {
        
        return self.x < other.minX ||
            self.x > other.maxX ||
            self.y < other.minX ||
            self.y > other.maxY
    }
}
    
class SecondScene: SKScene {



}


PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code
