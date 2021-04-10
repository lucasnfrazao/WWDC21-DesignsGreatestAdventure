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
Typography: **.largeTitle, .headline, .title, .body** \
Colors: **.purple, .pink, ,blue**

 ---

 When you're ready, go to the [next page](@next) to see how an accessible interface will help grandma climb the **Best Practices Mountain**!
 
*/
//#-hidden-code

import PlaygroundSupport
import UIKit

enum TypographyFirst {
    
    case largeTitle, headline
    
}

enum TypographySecond {
    
    
    case title, body
    
}

enum Colors {
    
    case purple, pink, blue
    
}

public let uiView = UIView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))

public class Escape: UIViewController {
    
    var points: Int = 0
    
    var phoneScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
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
        label.numberOfLines = 2
        label.text = "to help you design better and more accessible interfaces"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    var sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Titles should be bigger..."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionBody: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "Than the body of your text. This is how your users will be able to differentiate which informations need their most attention."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Titles should be bigger..."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionBody2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "Than the body of your text. This is how your users will be able to differentiate which informations need their most attention."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    

    var firstSectionBG: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .systemPurple
        uiView.layer.cornerRadius = 30
        uiView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return uiView
    }()
    
    
    var iPhoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "iPhone_Clear")
        return imageView
    }()
    
    var memoji: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Memoji_Sad")
        return imageView
    }()
    

    public override func viewDidLoad() {
        
        view.frame = CGRect(x:0 , y:0, width: 768, height: 1024)
        
        view.addSubview(phoneScreen)
        phoneScreen.addSubview(firstSectionBG)
        phoneScreen.addSubview(appTitle)
        phoneScreen.addSubview(appSubtitle)
        phoneScreen.addSubview(iPhoneImage)
        phoneScreen.addSubview(sectionTitle)
        phoneScreen.addSubview(sectionBody)
        
        phoneScreen.addSubview(sectionTitle2)
        phoneScreen.addSubview(sectionBody2)
        
        //view.addSubview(pageTitle)
        //view.addSubview(pageSubtitle)
        view.addSubview(memoji)
        
        setupConstraints()
        editableCodes()
        
        if points >= 2 {
            
            memoji.image = UIImage(named: "Memoji_Smile")
    
        }
        
    }
    
    public func editableCodes() {
        //#-end-hidden-code
        
        //: Top Section
        firstSectionAttributes(typography: /*#-editable-code*/.largeTitle/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/.blue/*#-end-editable-code*/)
        
        //: Bottom Section
        secondSectionAttributes(typography: /*#-editable-code*/.title/*#-end-editable-code*/)
        
        
        //#-hidden-code
        
    }
    
    
    public func setupConstraints() {
        
        NSLayoutConstraint.activate([
            phoneScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //phoneScreen.heightAnchor.constraint(equalTo: iPhoneImage.heightAnchor, multiplier: 0.9),
            phoneScreen.widthAnchor.constraint(equalTo: phoneScreen.heightAnchor, multiplier: 9/19.5),
            phoneScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            phoneScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            iPhoneImage.centerXAnchor.constraint(equalTo: phoneScreen.centerXAnchor),
            iPhoneImage.topAnchor.constraint(equalTo: phoneScreen.topAnchor),
            iPhoneImage.bottomAnchor.constraint(equalTo: phoneScreen.bottomAnchor),
            memoji.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            memoji.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -40)
            
        ])
        
        setupFirstSection()
        
        pageSubtitle.font = UIFont.systemFont(ofSize: pageTitle.font.pointSize/2, weight: .regular)
    
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    
    public func setupFirstSection() {
        
        NSLayoutConstraint.activate([
            firstSectionBG.topAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.topAnchor),
            firstSectionBG.bottomAnchor.constraint(equalTo: appSubtitle.bottomAnchor, constant: 10),
            firstSectionBG.centerXAnchor.constraint(equalTo: phoneScreen.centerXAnchor),
            //firstSectionBG.heightAnchor.constraint(equalTo: phoneScreen.heightAnchor, multiplier: 0.5),
            firstSectionBG.leadingAnchor.constraint(equalTo: phoneScreen.leadingAnchor),
            firstSectionBG.trailingAnchor.constraint(equalTo: phoneScreen.trailingAnchor),
            
            appTitle.topAnchor.constraint(equalTo: firstSectionBG.topAnchor, constant: 150),
            appTitle.bottomAnchor.constraint(equalTo: appSubtitle.topAnchor),
            appTitle.leadingAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.leadingAnchor, constant: 20),
            appTitle.trailingAnchor.constraint(equalTo: phoneScreen.layoutMarginsGuide.trailingAnchor, constant: -20),
            
            appSubtitle.topAnchor.constraint(equalTo: appTitle.bottomAnchor),
            appSubtitle.leadingAnchor.constraint(equalTo: appTitle.leadingAnchor),
            appSubtitle.trailingAnchor.constraint(equalTo: appTitle.trailingAnchor),
            
            sectionTitle.topAnchor.constraint(equalTo: firstSectionBG.bottomAnchor, constant: 10),
            sectionTitle.leadingAnchor.constraint(equalTo: appTitle.leadingAnchor),
            sectionTitle.trailingAnchor.constraint(equalTo: appTitle.trailingAnchor),
            sectionBody.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 5),
            sectionBody.leadingAnchor.constraint(equalTo: appTitle.leadingAnchor),
            sectionBody.trailingAnchor.constraint(equalTo: appTitle.trailingAnchor),
            
            
            sectionTitle2.topAnchor.constraint(equalTo: sectionBody.bottomAnchor, constant: 15),
            sectionTitle2.leadingAnchor.constraint(equalTo: sectionTitle.leadingAnchor),
            sectionTitle2.trailingAnchor.constraint(equalTo: sectionTitle.trailingAnchor),
            
            
            sectionBody2.topAnchor.constraint(equalTo: sectionTitle2.bottomAnchor, constant: 5),
            sectionBody2.leadingAnchor.constraint(equalTo: sectionTitle2.leadingAnchor),
            sectionBody2.trailingAnchor.constraint(equalTo: sectionTitle2.trailingAnchor),
        ])
        
    }
    
    
    func firstSectionAttributes(typography: TypographyFirst, backgroundColor: Colors) {
        
        if typography == .largeTitle {
            
            handleFirstSection(appTitle, isLargeTitle: true)
            points += 1
            
        } else {
            
            handleFirstSection(appTitle, isLargeTitle: false)
            appTitle.text = "This is kinda hard to read, right?"
            appSubtitle.text = "Try changing the attributes on the left to fix this!"
            
        }
        
        if backgroundColor == .blue {
            
            handleColors(firstSectionBG, color: .systemBlue)
             
        } else if backgroundColor == .pink {
            
            handleColors(firstSectionBG, color: .systemPink)
            
        } else {
            
            handleColors(firstSectionBG, color: .systemPurple)
            
            
        }
        
        
    }
    
    
    func handleFirstSection(_ label: UILabel, isLargeTitle: Bool) {
        
        label.textAlignment = .left
        label.text = "Here are some tips"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        
        if isLargeTitle {
            
            label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            
        } else {
            label.font = UIFont.boldSystemFont(ofSize: 10)
            
        }
    }
    
    
    func secondSectionAttributes(typography: TypographySecond) {
        
        if typography == .title {
            
            handleSecondSection(sectionTitle, isTitle: true)
            handleSecondSection(sectionTitle2, isTitle: true)
            points += 1
            
        } else {
            
            handleSecondSection(sectionTitle, isTitle: false)
            handleSecondSection(sectionTitle2, isTitle: false)
            
        }
        
    }
    
    
    func handleSecondSection(_ label: UILabel, isTitle: Bool) {
        
        label.textAlignment = .left
        label.text = "This is a title"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        
        if isTitle {
            
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.text = "Size and Weight are important"
            
        } else {
            
            label.font = UIFont.boldSystemFont(ofSize: 7)
            label.text = "Titles should be bigger..."
            
        }
    }

    func handleColors(_ view: UIView, color: UIColor) {
        
        view.backgroundColor = color
        self.view.backgroundColor = color
        
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




