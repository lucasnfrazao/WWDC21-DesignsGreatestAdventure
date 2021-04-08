/*:
 
### The Journey
 
Now that we've established more advaced topics of UI design, it's time for a very important aspect that is essential to how we think about design: **Accessibility**.

According to the Census Bureau from 2012, **57 million Americans** have some type of disability and many of them report some sort of impact from the lack of accessibility on websites, applications or documents.

In order to make any project accesible to everyone, we have to be aware of design decisions since the beginning. And there are some frameworks and technologies that we can use to achieve a better experience for everyone!

Today, we are going to talk about two of them:

- Dynamic Type
- Magnifier

 * Callout(Keep in mind):
User testing is a must-have for any accessibility feature in your app. That is how you will make sure your choices have the impact you intended. Design is an on-going process, so you will always have something to improve!

This time, your goal is to help Lucas' grandma finish her reading exercise by changing the font's and window's size using the on-screen buttons. This way Lucas' grandma will be able to use your app more easily!

Tap **Run My Code** when you're ready!

 */
 //#-hidden-code
 
//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

public class Journey: SKScene {
    
  
    public override func didMove(to view: SKView) {
        
   
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first!
        //let touchLocation = touch.location(in: self)
        
        
        
    }
    
    
    func animation(endMessage: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 650, duration: 0.3)
        endMessage.run(moveToCenter)
        
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
