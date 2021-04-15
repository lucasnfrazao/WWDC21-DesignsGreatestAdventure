/*:
 ![StartBanner](StartBasicsv2.png)
 
 Today we're going to talk about **user interfaces**. Designing well-thought-out user interfaces, or UI for short, is a very important step on the making of great and accessible experiences for **everyone**!
 
 Although it's a very complex subject, there are some concepts that we can use in order to achieve better results when projecting our apps.

 According to Usability.gov, every project should follow some best practices for its interface development.

 Here we are going to explore three of them:

 - Simplicity
 - Consistency
 - Purpose

 To start our journey into the world of UI design, you will need to help Lucas with his new side project: help his grandmother learn more about designing interfaces and how useful it can be when using apps!

 Your goal here will be to complete **three** challenges to help Lucas' grandma during her journey to enter the **Great World of Design**!
 
 Tap **Run My Code** to help her!

 When you're ready, go to the [next page](@next) to continue grandma's adventure.

 
 - Note:
   For an optimal experience, run on Split Screen mode.
 
*/
//#-hidden-code

import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
public let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))
if let scene = FirstScene(fileNamed: "FirstScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    // Present the scene
    sceneView.presentScene(scene)
}

var sceneManager = SceneManager()

public class FirstScene: SKScene, SKPhysicsContactDelegate {
    
    private let movableArrow = "movable"
    private var selectedNode = SKSpriteNode()
    
    var nextButton: SKSpriteNode!
    var sign: SKSpriteNode!
    var arrows: SKSpriteNode!
    
    var title: SKLabelNode!
    var subtitle: SKLabelNode!
    
    var emptyNode: SKSpriteNode!
    
    var endMessage: SKSpriteNode!
    
    var points: Int = 0
    
    public override func didMove(to view: SKView) {
        
        nextButton = childNode(withName: "//next") as? SKSpriteNode
        sign = childNode(withName: "//sign") as? SKSpriteNode
        arrows = childNode(withName: "//movable") as? SKSpriteNode
        
        endMessage = childNode(withName: "//endMessage") as? SKSpriteNode
        
        title = childNode(withName: "//title") as? SKLabelNode
        subtitle = childNode(withName: "//subtitle") as? SKLabelNode
    
        nextButton.isHidden = true
        
    }
    
    @objc static public override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    
    func animation(endMessage: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 250, duration: 0.3)
        moveToCenter.timingMode = .easeInEaseOut
        endMessage.run(moveToCenter)
        
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

        //selectNodeForTouch(touchLocation: touchLocation)
        
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode.name == movableArrow {
        
            selectedNode = touchedNode as! SKSpriteNode
            
        }
        
        
        
        if nextButton.contains(touchLocation) {
            
            sceneManager.transition(self, toScene: SecondScene(fileNamed: "SecondScene")!)
            
        }
        
    }
    
    public override func sceneDidLoad()
    {
        super.sceneDidLoad()

        self.size.width = self.size.height * (UIScreen.main.bounds.size.width / UIScreen.main.bounds.size.height)
        self.scaleMode = .aspectFit
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
            for t in touches {

                let location = t.location(in: self)

                if selectedNode.name == movableArrow {
                
                    selectedNode.position.x = location.x
                    selectedNode.position.y = location.y
                
                }

            }
        
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if arrows.intersects(sign) {
            
            
            
        } else {
            
            points += 1
            nextButton.isHidden = false
            
            if points == 1 {
            animation(endMessage: endMessage)
            }
                
        }
            
        
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }

    func selectNodeForTouch(touchLocation: CGPoint) {
      // 1
    let sequence = SKAction.sequence([ SKAction.rotate(byAngle: degToRad(degree: -4.0), duration: 0.2), SKAction.rotate(byAngle: 0.0, duration: 0.1),SKAction.rotate(byAngle: degToRad(degree: 4.0), duration: 0.2)])
        
    let touchedNode = self.atPoint(touchLocation)
      
      if touchedNode.name == movableArrow {
        if !selectedNode.isEqual(touchedNode) {
          selectedNode.removeAllActions()
          selectedNode = touchedNode as! SKSpriteNode
          //selectedNode.run(SKAction.repeatForever(sequence))
          
        }
      }
      
      else {
        
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

    private var selectedNode = SKSpriteNode()
    
    var wrongAnswer: SKSpriteNode!
    
    var correctAnswer1: SKSpriteNode!
    var correctAnswer2: SKSpriteNode!
    var correctAnswer3: SKSpriteNode!
    
    var signal1: SKSpriteNode!
    var signal2: SKSpriteNode!
    var signal3: SKSpriteNode!
    
    var nextButton: SKSpriteNode!
    
    var answers : [SKSpriteNode] = []
    var selectedNodes : [SKSpriteNode] = []
    var points : Int = 0
    
    var ready: Int = 0
    
    var endMessage: SKSpriteNode!
    
    let scaleUpAction = SKAction.scale(to: 1.15, duration: 0.5)
    let scaleDownAction = SKAction.scale(to: 1.10, duration: 0.3)
    let selectedAction = SKAction.scale(to: 0.85, duration: 0.3)
    let selectedAlpha = SKAction.fadeAlpha(to: 0.5, duration: 0.5)
    let unselectedAlpha = SKAction.fadeAlpha(to: 1, duration: 0.5)
    
    var signals: [SKSpriteNode] = []
    
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }
    
    override func didMove(to view: SKView) {
        
        signal1 = SKSpriteNode(imageNamed: "signal")
        signal2 = SKSpriteNode(imageNamed: "signal")
        signal3 = SKSpriteNode(imageNamed: "signal")
        
        signals.append(signal1)
        signals.append(signal2)
        signals.append(signal3)
        
        for signal in signals {
            
            signal.alpha = 0
            signal.setScale(0.5)
 
        }
   
        correctAnswer1 = childNode(withName: "//correct1") as? SKSpriteNode
        correctAnswer2 = childNode(withName: "//correct2") as? SKSpriteNode
        correctAnswer3 = childNode(withName: "//correct3") as? SKSpriteNode
        
        wrongAnswer = childNode(withName: "//wrong") as? SKSpriteNode
        
        endMessage = childNode(withName: "//endMessage") as? SKSpriteNode
        
        nextButton = childNode(withName: "//next") as? SKSpriteNode
        
        answers = [correctAnswer1, correctAnswer2, correctAnswer3]
        
        nextButton.isHidden = true
        
        correctAnswer1.addChild(signal1)
        correctAnswer2.addChild(signal2)
        correctAnswer3.addChild(signal3)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)

        let rotationSequence = SKAction.sequence([ SKAction.rotate(byAngle: degToRad(degree: -8.0), duration: 0.2), SKAction.rotate(byAngle: 0.0, duration: 0.1),SKAction.rotate(byAngle: degToRad(degree: 8.0), duration: 0.2),SKAction.rotate(byAngle: 0.0, duration: 0.1)])
        
        let sequence = SKAction.sequence([scaleUpAction, scaleDownAction])
        
        let selectedSequence = SKAction.sequence([selectedAction])
        
        let touchedNode = self.atPoint(touchLocation)
        
        for i in 0..<answers.count {
            
            let answer = answers[i]
            
            if answer.contains(touchLocation) {
                checkNodes(node: answer)
                answer.run(selectedSequence)
                answer.run(SKAction.fadeAlpha(to: 0.5, duration: 1.0))
                
                if answer.children.count != 0 {
                
                    answer.children[0].alpha = 1.0
                    
                }
                
            }
            
            for selectedNode in selectedNodes {
            
            if points == 3 {
                
                ready += 1
                
                selectedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 1.0))
                
                for signal in signals {
                    signal.removeFromParent()
                }
                
                selectedNode.run(SKAction.repeatForever(sequence))
             
                enumerateChildNodes(withName: "wrong") {
                        node, stop in
                        node.alpha = 0.4
                }
                
                self.loadNextScene()
       
            }
                
            }
            
        }
        
        if touchedNode.name == "wrong" {
          if !selectedNode.isEqual(touchedNode) {
            selectedNode = touchedNode as! SKSpriteNode
            selectedNode.run(SKAction.repeat(rotationSequence, count: 5))
            
          }
        }
        
        
        if nextButton.contains(touchLocation) {
            
            sceneManager.transition(self, toScene: ThirdScene(fileNamed: "ThirdScene")!)
            
        }
        
    }
    
    func loadNextScene() {
        
        nextButton.isHidden = false
        
        if ready == 1 {
            animation(endMessage: endMessage)
        }
            
    }
    
    func checkNodes(node: SKSpriteNode) {
        
        if !selectedNodes.contains(node) {
            
            selectedNodes.append(node)
            points += 1
            
        } else {
            
        }
        
    }
    
    
    func animation(endMessage: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 250, duration: 0.3)
        moveToCenter.timingMode = .easeInEaseOut
        endMessage.run(moveToCenter)
        
    }
    
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//#-end-hidden-code
