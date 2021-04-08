/*:
 
### Escape from Bad Design Land
 
 We've covered the basics of interface design and helped Lucas' grandma to enter the **Great World of Design**. Now, let's take another step to talk about other important aspects of UI Design.

 According to a study by the **Nielsen Norman Group**, a bad designed interface can have serious impacts on how your project is received. Developing a solid experience for everyone can be big challenge and there are a lot of tasks we have to check off in order to reach the best possible results.

 There are **three aspects** that will make a huge difference in how our app is perceived:

 - Typography
 - Colors
 - Grids
 
 As grandma entered the World of Design, she came across the **BadDesignLand**. Now, you're objective is to help her escape from it by choosing the correct attributes to the functions below.

 Tap **Run My Code** when you're ready!
 
 
 * Callout(Tips):
Typography: **.largeTitle, .headline** \
Colors: **.lightBlue, .lightOrange** \
Grids: **.edges, .center**
 

 ---

 When you're ready, go to the [next page](@next) to see how an accessible interface will help grandma climb the **Best Practices Mountain**!
 
*/
//#-hidden-code

import PlaygroundSupport
import UIKit

enum Typography {
    
    case largeTitle, headline
    
}

enum Colors {
    
    case blue, orange
    
}

enum Grids {
    
    case edges, center
    
}

public let uiView = UIView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))

public class Escape: UIViewController {
    
    var phoneScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var pageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Escape!"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        return label
    }()
    
    var pageSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Choose the correct options on the left to escape from BadDesignLand"
        label.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    var iPhoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "iPhone")
        return imageView
    }()
    

    public override func viewDidLoad() {
        
        view.frame = CGRect(x:0 , y:0, width: 768, height: 1024)
        
        view.backgroundColor = UIColor(red: 0.80, green: 0.62, blue: 0.93, alpha: 1.00)
        
        view.addSubview(pageTitle)
        view.addSubview(pageSubtitle)
        view.addSubview(phoneScreen)
        view.addSubview(iPhoneImage)
        setupConstraints()
        
    }
    
    public func setupConstraints() {
        
        NSLayoutConstraint.activate([
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            pageSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            pageSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            pageSubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageSubtitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 10),
            iPhoneImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneImage.widthAnchor.constraint(equalToConstant: 418),
            iPhoneImage.topAnchor.constraint(equalTo: pageSubtitle.bottomAnchor, constant: 30),
            iPhoneImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            phoneScreen.leadingAnchor.constraint(equalTo: iPhoneImage.leadingAnchor),
            phoneScreen.trailingAnchor.constraint(equalTo: iPhoneImage.trailingAnchor),
            phoneScreen.centerXAnchor.constraint(equalTo: iPhoneImage.centerXAnchor),
            phoneScreen.topAnchor.constraint(equalTo: iPhoneImage.topAnchor),
            phoneScreen.bottomAnchor.constraint(equalTo: iPhoneImage.bottomAnchor, constant: -10),
            
        ])
    
    }
    
    
    func constantsTest(typography: Typography) {
        
        print(typography.hashValue)
        
    }
    
    
    
    
}

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }

        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }

        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0

        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}

let viewController = Escape()
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code



////#-end-hidden-code
////: Typography.
//constantsTest(typography: /*#-editable-code*/.largeTitle/*#-end-editable-code*/)
////#-hidden-code
