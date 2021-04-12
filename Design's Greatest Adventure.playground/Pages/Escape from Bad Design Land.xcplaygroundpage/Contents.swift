/*:
 
 ![Bad Design Land](BadDesignLand.png)
 
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
    
    case purple, pink, blue, yellow
    
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
        label.text = "Font size and weight are important"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionBody: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "They should communiate the most immediate and crucial information to the user. This is how your users will be able to differentiate which part of the text needs their most attention first!."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionTitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Context is key"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionBody2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "Every family of fonts and their alternative versions have their own usage in different scenarios. Your app's typography should talk the same language that it aims to share with its users."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionTitle3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Consistency, consistency, consistency"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var sectionBody3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "Similar font sizes and weights should be used to indicate similar purporses or actions."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var finalMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "You've fixed all the issues with the app's design! Now you can go to the next page to help grandma get to the top of Great World of Design."
        //label.textColor = .systemBlue
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
        
        phoneScreen.addSubview(sectionTitle3)
        phoneScreen.addSubview(sectionBody3)
        
        //phoneScreen.addSubview(finalMessage)
        
        //view.addSubview(pageTitle)
        //view.addSubview(pageSubtitle)
        view.addSubview(memoji)
        
        setupConstraints()
        editableCodes()
        
        if points >= 3 {
            
            memoji.image = UIImage(named: "Memoji_Smile")
    
        } else {
            
            //finalMessage.text = "There are some tweaks needed to fix the app's interface. Try changing some of them on the left!"
            
            //finalMessage.textColor = .gray
            
        }
        
    }
    
    public func editableCodes() {
        //#-end-hidden-code
        
        //: Top Section
        firstSectionAttributes(typography: /*#-editable-code*/.largeTitle/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/.purple/*#-end-editable-code*/)
        
        //: Bottom Section
        secondSectionAttributes(typography: /*#-editable-code*/.title/*#-end-editable-code*/)
        
        
        //#-hidden-code
        
    }
    
    
    public func setupConstraints() {
        
        NSLayoutConstraint.activate([
            phoneScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            phoneScreen.widthAnchor.constraint(equalTo: phoneScreen.heightAnchor, multiplier: 9/19.5),
            phoneScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            phoneScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            iPhoneImage.centerXAnchor.constraint(equalTo: phoneScreen.centerXAnchor),
            iPhoneImage.topAnchor.constraint(equalTo: phoneScreen.topAnchor),
            iPhoneImage.bottomAnchor.constraint(equalTo: phoneScreen.bottomAnchor),
            memoji.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            memoji.trailingAnchor.constraint(equalTo: phoneScreen.leadingAnchor, constant: 20),
            memoji.bottomAnchor.constraint(equalTo: phoneScreen.bottomAnchor)
            
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
            
            sectionTitle3.topAnchor.constraint(equalTo: sectionBody2.bottomAnchor, constant: 15),
            sectionTitle3.leadingAnchor.constraint(equalTo: sectionTitle2.leadingAnchor),
            sectionTitle3.trailingAnchor.constraint(equalTo: sectionTitle2.trailingAnchor),
            
            
            sectionBody3.topAnchor.constraint(equalTo: sectionTitle3.bottomAnchor, constant: 5),
            sectionBody3.leadingAnchor.constraint(equalTo: sectionTitle3.leadingAnchor),
            sectionBody3.trailingAnchor.constraint(equalTo: sectionTitle3.trailingAnchor),
            
            
//            finalMessage.bottomAnchor.constraint(equalTo: phoneScreen.bottomAnchor, constant: -60),
//            finalMessage.leadingAnchor.constraint(equalTo: sectionTitle3.leadingAnchor),
//            finalMessage.trailingAnchor.constraint(equalTo: sectionTitle3.trailingAnchor),
            
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
            points += 1
            
        } else if backgroundColor == .pink {
            
            handleColors(firstSectionBG, color: .systemPink)
            points += 1
            
        } else if backgroundColor == .purple {
            
            handleColors(firstSectionBG, color: .systemPurple)
            points += 1
            
            
        } else {
            
            handleColors(firstSectionBG, color: .systemYellow)
            
            
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
        //label.text = "Titles should be bigger..."
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        
        if isTitle {
            
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            //label.text = "Size and Weight are important"
            
        } else {
            
            label.font = UIFont.boldSystemFont(ofSize: 7)
            label.text = "Titles should be bigger..."
            
        }
    }

    func handleColors(_ view: UIView, color: UIColor) {
        
        view.backgroundColor = color
        self.view.backgroundColor = color
        finalMessage.textColor = color
        
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




