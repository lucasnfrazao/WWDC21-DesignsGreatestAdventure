import PlaygroundSupport
import SpriteKit

public class ThirdScene: SKScene {
    
    var path1: SKSpriteNode!
    var path2: SKSpriteNode!
    var path3: SKSpriteNode!
    
    public override func didMove(to view: SKView) {
        
        path1 = childNode(withName: "//path_1") as? SKSpriteNode
        path2 = childNode(withName: "//path_2") as? SKSpriteNode
        path3 = childNode(withName: "//path_3") as? SKSpriteNode
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        
        if path3.contains(touchLocation) {
            
            print("CAMINHO CERTO!")
            
        }
        
        
        
    }
    
    
    
}
