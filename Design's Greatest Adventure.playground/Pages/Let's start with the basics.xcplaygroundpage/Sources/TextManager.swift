import Foundation
import SpriteKit


public class TextManager {
    
    public init() {}
    //static let shared = TextManager()
    
    public func setTextFontSize(title: SKLabelNode, subtitle: SKLabelNode) {
        
        title.fontName = UIFont.systemFont(ofSize: 80.0, weight: .black).fontName
        subtitle.fontName = UIFont.systemFont(ofSize: 30.0).fontName
        
    }
    
    
    
}

