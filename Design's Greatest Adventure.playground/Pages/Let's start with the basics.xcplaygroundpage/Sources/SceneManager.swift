import Foundation
import SpriteKit

public class SceneManager {
    
    public init() {}
    static let shared = SceneManager()
    
    public func transition(_ fromScene: SKScene, toScene: SKScene) {
        toScene.scaleMode = .aspectFill
        fromScene.view?.presentScene(toScene)
    }
 
}
