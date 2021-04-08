/*:
 
### Escape from Bad Design Land
 
 We've covered the basics of interface design and helped Lucas' grandma to enter the **Great World of Design**. Now, let's take another step to talk about other important aspects of UI Design.

 According to a study by the **Nielsen Norman Group**, a bad designed interface can have serious impacts on how your project is received. Developing a solid experience for everyone can be big challenge and there are a lot of tasks we have to check off in order to reach the best possible results.

 But there are **two aspects** that will make a huge difference in how our app is perceived:

 - Typography
 - Colors
 
 As grandma entered the World of Design, she came across the **BadDesignLand**. Now, you're objective is to help her escape from it by choosing the correct attributes that make the app's desig better!

 Tap **Run My Code** when you're ready!
 
 
 * Callout(Tips):
Typography: **.largeTitle, .headline** \
Colors: **.lightBlue, .lightOrange**

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

public let uiView = UIView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))

public class Escape: UIViewController {
    
    var phoneScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.80, green: 0.62, blue: 0.93, alpha: 1.00)
        //view.layer.cornerRadius = 45
        return view
    }()
    
    var pageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Escape!"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var pageSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Choose the correct options on the left to escape from BadDesignLand"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    var appTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var appSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "about UI Design"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    var firstSectionBG: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .systemPurple
        uiView.layer.cornerRadius = 50
        return uiView
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
        
        phoneScreen.addSubview(firstSectionBG)
        phoneScreen.addSubview(appTitle)
        phoneScreen.addSubview(appSubtitle)
        
        view.addSubview(iPhoneImage)
        
        setupConstraints()
        editableCodes()
    }
    
    public func editableCodes() {
        //#-end-hidden-code
        
        //: Typography.
        typographyAttributes(firstSection: /*#-editable-code*/.largeTitle/*#-end-editable-code*/, secondSection: /*#-editable-code*/.headline/*#-end-editable-code*/)
        //#-hidden-code
        
    }
    
    
    public func setupConstraints() {
        
        NSLayoutConstraint.activate([
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            pageSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            pageSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            pageSubtitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            iPhoneImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneImage.topAnchor.constraint(equalTo: pageSubtitle.bottomAnchor, constant: 20),
            iPhoneImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            phoneScreen.centerXAnchor.constraint(equalTo: iPhoneImage.centerXAnchor),
            phoneScreen.centerYAnchor.constraint(equalTo: iPhoneImage.centerYAnchor),
            phoneScreen.heightAnchor.constraint(equalTo: phoneScreen.widthAnchor, multiplier: 19.5/9),
            phoneScreen.topAnchor.constraint(equalTo: iPhoneImage.topAnchor),
            phoneScreen.bottomAnchor.constraint(equalTo: iPhoneImage.bottomAnchor),
        ])
        
        setupFirstSection()
        
        pageSubtitle.font = UIFont.systemFont(ofSize: pageTitle.font.pointSize/2, weight: .regular)
    
    }
    
    
    public func setupFirstSection() {
        
        NSLayoutConstraint.activate([
        
            firstSectionBG.topAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.topAnchor),
            firstSectionBG.centerXAnchor.constraint(equalTo: phoneScreen.centerXAnchor),
            firstSectionBG.heightAnchor.constraint(equalTo: phoneScreen.heightAnchor, multiplier: 0.4),
            firstSectionBG.widthAnchor.constraint(equalTo: phoneScreen.widthAnchor),
            //firstSectionBG.leadingAnchor.constraint(equalTo: phoneScreen.leadingAnchor),
            //firstSectionBG.trailingAnchor.constraint(equalTo: phoneScreen.trailingAnchor),
            appTitle.bottomAnchor.constraint(equalTo: appSubtitle.topAnchor),
            appTitle.leadingAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.leadingAnchor, constant: 20),
            appTitle.trailingAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.trailingAnchor, constant: -20),
            appSubtitle.topAnchor.constraint(equalTo: appTitle.bottomAnchor),
            appSubtitle.leadingAnchor.constraint(equalTo: appTitle.leadingAnchor),
            appSubtitle.trailingAnchor.constraint(equalTo: appTitle.trailingAnchor),
            appSubtitle.bottomAnchor.constraint(equalTo: firstSectionBG.bottomAnchor, constant: -10),
        ])
        
        
    }
    
    
    func typographyAttributes(firstSection: Typography, secondSection: Typography) {
        
        switch firstSection {
        
        case .largeTitle:
            return handleTypography(appTitle, isLargeTitle: true)
        case .headline:
            return handleTypography(appTitle, isLargeTitle: false)
            
        }
        
        //print(firstSection.hashValue)
        
    }
    
    
    func handleTypography(_ label: UILabel, isLargeTitle: Bool) {
        
        if isLargeTitle {
            
            label.textAlignment = .left
            label.text = "This is a story"
            label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            
        } else {
            
            label.textAlignment = .left
            label.text = "This is a story"
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            
        }
        
        
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




