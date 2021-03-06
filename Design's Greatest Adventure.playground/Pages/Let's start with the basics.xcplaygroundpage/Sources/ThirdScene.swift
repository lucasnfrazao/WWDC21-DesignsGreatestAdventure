import PlaygroundSupport
import SpriteKit

public class ThirdScene: SKScene {
    
    var path1: SKSpriteNode!
    var path2: SKSpriteNode!
    var path3: SKSpriteNode!
    
    var road1: SKSpriteNode!
    var road2: SKSpriteNode!
    var road3: SKSpriteNode!
    
    var door: SKSpriteNode!
    
    var endMessage: SKSpriteNode!
    
    var points: Int = 0
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(Double(degree) / 180.0 * Double.pi)
    }
    
    public override func sceneDidLoad()
    {
        super.sceneDidLoad()

        self.size.width = self.size.height * (UIScreen.main.bounds.size.width / UIScreen.main.bounds.size.height)
        self.scaleMode = .aspectFit
    }
    
    
    public override func didMove(to view: SKView) {
        
        path1 = childNode(withName: "//path_1") as? SKSpriteNode
        path2 = childNode(withName: "//path_2") as? SKSpriteNode
        path3 = childNode(withName: "//path_3") as? SKSpriteNode
        
        road1 = childNode(withName: "//road1") as? SKSpriteNode
        road2 = childNode(withName: "//road2") as? SKSpriteNode
        road3 = childNode(withName: "//road3") as? SKSpriteNode
        
        door = childNode(withName: "//door") as? SKSpriteNode
        
        endMessage = childNode(withName: "//endMessage") as? SKSpriteNode
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        
        let rotationSequence = SKAction.sequence([ SKAction.rotate(byAngle: degToRad(degree: -4.0), duration: 0.2), SKAction.rotate(byAngle: 0.0, duration: 0.1),SKAction.rotate(byAngle: degToRad(degree: 4.0), duration: 0.2),SKAction.rotate(byAngle: 0.0, duration: 0.1)])
        
        if path2.contains(touchLocation) || road2.contains(touchLocation)  {
            
            path1.alpha = 0.4
            path3.alpha = 0.4
            road1.alpha = 0.4
            road3.alpha = 0.4
            
            door.texture = SKTexture(image: UIImage(named:"Door-Open")!)
            
            points += 1
            
            if points == 1 {
            
                animation(endMessage: endMessage)
                
            }
            
        }
        
        if path1.contains(touchLocation) || road1.contains(touchLocation) {
            
            road1.run(rotationSequence)
            path1.run(rotationSequence)
            
        }
        
        if path3.contains(touchLocation) || road3.contains(touchLocation)  {
            
            road3.run(rotationSequence)
            path3.run(rotationSequence)
            
        }
        
        
    }
    
    
    func animation(endMessage: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 250, duration: 0.3)
        moveToCenter.timingMode = .easeInEaseOut
        endMessage.run(moveToCenter)
        
    }
    
    
    
}
