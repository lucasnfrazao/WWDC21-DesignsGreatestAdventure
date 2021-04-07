/*:
 ![StartBanner](StartBasics.png)
 
 Today, we're going to talk about **user interfaces**. Designing well-thought-out user interfaces, or UI for short, is a very important step on the making of great and accessible experiences for **everyone**!
 
 Although it's a very complex subject, there are some concepts that we can use in order to achieve better results when projecting our apps.

 According to Usability.gov, every project should follow some best practices for its interface development.

 Here, we are going to explore three of them:

 - Simplicity
 - Consistency
 - Purpose

 To start our journey into the world of UI design, you will need to help Lucas with his new side project: his grandma just got a new iPhone and she's super excited to explore everything she can possibly do with it.

 Your goal here will be to complete three challenges to help Lucas' grandma enter the **Great World of Design**!

 Tap **Run My Code** to help her!

 When you're ready, go to the [next page](@next) to continue grandma's adventure.
 
*/
//#-hidden-code

import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
public let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    // Present the scene
    sceneView.presentScene(scene)
}

var sceneManager = SceneManager()

public class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //private var label : SKLabelNode!
    //private var spinnyNode : SKShapeNode!
    private let movableArrow = "movable"
    private var selectedNode = SKSpriteNode()
    
    var nextButton: SKSpriteNode!
    var sign: SKSpriteNode!
    var arrows: SKSpriteNode!
    var title: SKLabelNode!
    var subtitle: SKLabelNode!
    var textManager = TextManager()
    
    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.93, green: 0.83, blue: 0.62, alpha: 1.0)
        
        nextButton = childNode(withName: "//next") as? SKSpriteNode
        sign = childNode(withName: "//sign") as? SKSpriteNode
        arrows = childNode(withName: "//movable") as? SKSpriteNode
        
        title = childNode(withName: "//title") as? SKLabelNode
        subtitle = childNode(withName: "//subtitle") as? SKLabelNode
        
        nextButton.isHidden = true
        
        //textManager.setTextFontSize(title: title, subtitle: subtitle)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
    }
    
    @objc static public override var supportsSecureCoding: Bool {
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
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)

        selectNodeForTouch(touchLocation: touchLocation)
        
        nextButton.isHidden = false
        
        if nextButton.contains(touchLocation) {
            
            sceneManager.transition(self, toScene: SecondScene(fileNamed: "SecondScene")!)
            
        }
        
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
            for t in touches {

                let location = t.location(in: self)
                
                    selectedNode.position.x = location.x
                    selectedNode.position.y = location.y
                    
            }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }

    func selectNodeForTouch(touchLocation: CGPoint) {
      // 1
        let touchedNode = self.atPoint(touchLocation)
      
      if touchedNode.name == movableArrow {
        if !selectedNode.isEqual(touchedNode) {
          selectedNode.removeAllActions()
          selectedNode = touchedNode as! SKSpriteNode
        let sequence = SKAction.sequence([ SKAction.rotate(byAngle: degToRad(degree: -4.0), duration: 0.2), SKAction.rotate(byAngle: 0.0, duration: 0.1),
                SKAction.rotate(byAngle: degToRad(degree: 4.0), duration: 0.2)])
            selectedNode.run(SKAction.repeatForever(sequence))
          
        }
      }
      
      else {
        
       print("Show where user needs to click.")
        
      }
        
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
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

class SecondScene: SKScene {

    var wrongAnswer: SKSpriteNode!
    var correctAnswer1: SKSpriteNode!
    var correctAnswer2: SKSpriteNode!
    var correctAnswer3: SKSpriteNode!
    var nextButton: SKSpriteNode!
    
    var answers : [SKSpriteNode] = []
    var selectedNodes : [SKSpriteNode] = []
    var points : Int = 0
    
    override func didMove(to view: SKView) {
        correctAnswer1 = childNode(withName: "//correct1") as? SKSpriteNode
        correctAnswer2 = childNode(withName: "//correct2") as? SKSpriteNode
        correctAnswer3 = childNode(withName: "//correct3") as? SKSpriteNode
        nextButton = childNode(withName: "//next") as? SKSpriteNode
        
        answers = [correctAnswer1, correctAnswer2, correctAnswer3]
        
        nextButton.isHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        
        let scaleUpAction = SKAction.scale(to: 1.15, duration: 0.5)
        let scaleDownAction = SKAction.scale(to: 1.10, duration: 0.3)
        
        let selectedAction = SKAction.scale(to: 0.85, duration: 0.3)
    
        let sequence = SKAction.sequence([scaleUpAction, scaleDownAction])
        
        for i in 0..<answers.count {
            
            let answer = answers[i]
            
            if answer.contains(touchLocation) {
                checkNodes(node: answer)
                answer.run(selectedAction)
            }
            
            if points >= 3 {
                
                self.loadNextScene(location: touchLocation)
                
                answer.run(SKAction.repeatForever(sequence))
                
                enumerateChildNodes(withName: "wrong") {
                        node, stop in
                        node.alpha = 0.4
                }
                
            }
            
        }
        
        
        
        
        
    }
    
    func loadNextScene(location: CGPoint) {
        
        nextButton.isHidden = false
        
        if nextButton.contains(location) {
            
            sceneManager.transition(self, toScene: ThirdScene(fileNamed: "ThirdScene")!)
            
        }
        
        
    }
    
    func checkNodes(node: SKSpriteNode) {
        
        if !selectedNodes.contains(node) {
            
            selectedNodes.append(node)
            points += 1
            
        } else {
            
            print("NÃO ADICIONA")
        }
        
    }
    
}

//extension CGPoint {
//
//    func isOutside(_ other:CGRect)->Bool {
//
//        return self.x < other.minX ||
//            self.x > other.maxX ||
//            self.y < other.minX ||
//            self.y > other.maxY
//    }
//}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code
