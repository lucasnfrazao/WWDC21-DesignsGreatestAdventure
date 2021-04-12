/*:
 
 ![The Journey](TheJourney.png)
 
Now that we've established more advaced topics of UI design, it's time for a very important aspect that is essential to how we think about design: **Accessibility**.

According to the Census Bureau from 2012, **57 million Americans** have some type of disability and many of them report some sort of impact from the lack of accessibility on websites, applications or documents.

In order to make any project accesible to everyone, we have to be aware of design decisions since the beginning. And there are some frameworks and technologies that we can use to achieve a better experience for everyone!

Today, we are going to talk about two of them:

- Dynamic Type
- Magnifier

This time, your goal is to help Lucas' grandma finish her reading exercise by changing the font's and window's size using the on-screen buttons. This way Lucas' grandma will be able to use your app more easily and get to the top of the snowy mountains of the Great World of Design!

Tap **Run My Code** when you're ready!

 */
 //#-hidden-code
 
//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

public class Journey: SKScene {
    
    var endMessage: SKSpriteNode!
    
    var bridgeLabel: SKLabelNode!
    
    var dynamic: SKSpriteNode!
    
    var magnifier: SKSpriteNode!
    
    var castle: SKSpriteNode!
    
    var player: SKSpriteNode!
    
    var background: SKSpriteNode!
    
    var loadSectionOne: Bool = false
    
    var loadSectionTwo: Bool = false
    
    var finishGameTwo: Bool = false
    
    var tapsDynamic: Int = 0
    
    var tapsMagnifier: Int = 0
    
    public override func didMove(to view: SKView) {
      
        bridgeLabel = childNode(withName: "//bridge") as? SKLabelNode
        
        dynamic = childNode(withName: "//dynamic") as? SKSpriteNode
        
        magnifier = childNode(withName: "//magnifier") as? SKSpriteNode
        
        player = childNode(withName: "//player") as? SKSpriteNode
        
        castle = childNode(withName: "//castle") as? SKSpriteNode
        
        endMessage = childNode(withName: "//endMessage") as? SKSpriteNode
        
        background = childNode(withName: "//background") as? SKSpriteNode
        
        castle.alpha = 0
        
        player.zPosition = 5
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        
        let rotationSequence = SKAction.sequence([ SKAction.rotate(byAngle: degToRad(degree: -4.0), duration: 0.2), SKAction.rotate(byAngle: 0.0, duration: 0.1),SKAction.rotate(byAngle: degToRad(degree: 4.0), duration: 0.2),SKAction.rotate(byAngle: 0.0, duration: 0.1)])
        
        let scaleDown = SKAction.scale(to: 1.2, duration: 0.2)
        scaleDown.timingMode = .easeIn
        
        let wait = SKAction.wait(forDuration: 0.1)
        
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        scaleUp.timingMode = .easeOut
    
        let touchSequence = SKAction.sequence([scaleDown, wait, scaleUp])
        
        if tapsDynamic != 3 {
        
        if dynamic.contains(touchLocation) {
            
            if bridgeLabel.fontSize <= 50 {
            
            bridgeLabel.fontSize += 10
                
            tapsDynamic += 1
                
            dynamic.run(touchSequence)
            
        }
            
            if tapsDynamic == 3 {
                    
            loadSectionOne = true
                
            }
            
            
        } else {
            
            dynamic.run(rotationSequence)
    
        }
            
            
        
        }
        
        if tapsDynamic == 3 {
        
        if tapsMagnifier != 3 {
            
            if magnifier.contains(touchLocation) {
            
                magnifierAction([player, castle])
                tapsMagnifier += 1
                magnifier.run(touchSequence)
                
            } else {
                
                magnifier.run(rotationSequence)
                
            }
    
        }
            
        }
        
        if tapsMagnifier == 3 {
            
            finishGameTwo = true
            
        }
        
  
    }
  
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }
    
    
    func passFirstLevel(_ node: SKSpriteNode) {
        
        let wait = SKAction.wait(forDuration: 3.5)
        
        let fadeOut = SKAction.fadeOut(withDuration: 1.5)
        let fadeIn = SKAction.fadeIn(withDuration: 1.5)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: bridgeLabel.position.x + 300, y: 40))
        
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 200)
        move.timingMode = .easeInEaseOut
    
        node.run(move)
        
        let changeTexture = SKAction.setTexture(SKTexture(imageNamed: "Second Mountatin"))
        
        let checkPosition = SKAction.run {
            
            self.loadSectionTwo = true
        }
            
        let sequence = SKAction.sequence([wait, changeTexture,  checkPosition, fadeIn])
        
        background.run(sequence)
        
        let opacity = SKAction.fadeAlpha(to: 0, duration: 0.5)
        
        bridgeLabel.run(SKAction.sequence([wait, opacity]))
  
    }
    
    
    func setupSecondLevel(_ node: SKSpriteNode) {
        
        let position = SKAction.move(to: CGPoint(x: -230, y: -345), duration: 0.5)
        position.timingMode = .easeInEaseOut
        
        let scaleDown = SKAction.scale(to: 0.3, duration: 0.2)
        scaleDown.timingMode = .easeInEaseOut
        
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        
        let animationSequence = SKAction.sequence([fadeOut, position, scaleDown, fadeIn])
        
        node.run(animationSequence)
        
        castle.run(fadeIn)
        
    }
    
    
    func magnifierAction(_ nodes: [SKSpriteNode]) {
        
        let scaleUp = SKAction.scale(by: 1.2, duration: 0.7)
        scaleUp.timingMode = .easeInEaseOut
        
        for node in nodes {
            
            node.run(scaleUp)
            
        }
        
    }
    
    func setupSecondLevelAnimation(_ node: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 290, duration: 0.8)
        moveToCenter.timingMode = .easeInEaseOut
        
        let wait = SKAction.wait(forDuration: 2.5)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: castle.position.x + 200, y: 25))
        
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 200)
        move.timingMode = .easeInEaseOut
        
        let sequence = SKAction.sequence([wait, move])
    
        node.run(sequence)
        
        endMessage.run(SKAction.sequence([wait, moveToCenter]))
        
        
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        
        if loadSectionOne {
            
            passFirstLevel(player)
            loadSectionOne = false
            dynamic.alpha = 0.4
     
        }
    
        if loadSectionTwo {
            
            setupSecondLevel(player)
            loadSectionTwo = false

        }
        
        if finishGameTwo {
            
            setupSecondLevelAnimation(player)
            magnifier.alpha = 0.4
            finishGameTwo = false
        }
        
    }
    
    
    func endGame() {
        
        
    }
    
    
}

public let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))
if let scene = Journey(fileNamed: "Journey") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView

//: [Next](@next)

//#-end-hidden-code
