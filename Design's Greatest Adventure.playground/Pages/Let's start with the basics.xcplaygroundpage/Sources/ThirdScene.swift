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
        
        if path3.contains(touchLocation) {
            
            path1.alpha = 0.4
            path2.alpha = 0.4
            road1.alpha = 0.4
            road2.alpha = 0.4
            
            door.texture = SKTexture(image: UIImage(named:"Door-Open")!)
            
            animation(endMessage: endMessage)
            
        }
        
        
        
    }
    
    
    func animation(endMessage: SKSpriteNode) {
        
        let moveToCenter = SKAction.moveTo(y: endMessage.position.y - 250, duration: 0.3)
        moveToCenter.timingMode = .easeInEaseOut
        endMessage.run(moveToCenter)
        
    }
    
    
    
}
