//
//  Commons.swift
//  SpaceBasic
//
//  Created by kashee on 13/06/18.
//  Copyright © 2018 Smaat. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setDiagonalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setVerticalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 226/255, green: 226/255, blue: 229/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}



extension UIFont {
    class func sfDisplaySemibold(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
    }
    
    class func sfDisplayMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    
    class func sfDisplayBold(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }
    
    class func sfDisplayLight(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
    }
    
    class func sfDisplayRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }
    
    class func sfDisplayItalic(ofSize size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
        //        return UIFont.systemFont(ofSize: size, weight: UIFontWeightI)
    }
}


func setRighImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 15.0, height: size.height)
    }
    arrow.contentMode = UIView.ContentMode.center
    textField.rightView = arrow
    textField.rightViewMode = UITextField.ViewMode.always
}

func setSmallRighImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 12.0, height: size.height-15)
    }
//    arrow.contentMode = UIViewContentMode.center
    arrow.contentMode = .scaleAspectFit
    textField.rightView = arrow
    textField.rightViewMode = UITextField.ViewMode.always
}

func setLeftImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height-15)
    }
    arrow.contentMode = .scaleAspectFit
    textField.leftView = arrow
    textField.leftViewMode = UITextField.ViewMode.always
}

func setAddButtonProperties(button:UIButton, image:String, bgrColor:UIColor){
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("New", for: .normal)
    button.setImage(UIImage(named: image), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.backgroundColor = bgrColor
    button.layer.cornerRadius = 18
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    
    let spacing = CGFloat(17.0) // the amount of spacing to appear between image and title
    button.imageEdgeInsets = UIEdgeInsets.init(top: 9, left: 10, bottom: 9, right: spacing)
    button.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: spacing, bottom: 0, right: 0)
    
}



public func isValidPassword(test:String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9])(?=.*[a-z]).{6,}")
    return passwordTest.evaluate(with: test)
}

public func onlyAlphabetAllowed(namveValue:String)->Bool{
    do {
        let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
        if regex.firstMatch(in: namveValue, options: [], range: NSMakeRange(0, namveValue.count)) != nil {
            //self.showAlert(message: "Must not contain Number in Name")
            return true
        } else {
            return false
        }
    }
    catch {
        return false
    }
}

func getScreenWidth() -> CGFloat{
    return UIScreen.main.bounds.width
}

func getScreenHeight() -> CGFloat{
    return UIScreen.main.bounds.height
}

struct Colors {

    static let selectedBdrClr = UIColor.init(red: 233/255, green: 239/255, blue: 224.0/255, alpha: 1)
    static let selectedbgrClr = UIColor.init(red: 0.0/255, green: 183.0/255, blue: 224.0/255, alpha: 1)
    
    static let unSelectedBdrClr = UIColor.init(red: 198/255, green: 204/255, blue: 209/255, alpha: 1)
    static let unSelectedbgrClr = UIColor.init(red: 251/255, green: 252/255, blue: 253/255, alpha: 1)
    
    static let rewardRGB = UIColor(red: 242/255, green: 186/255, blue: 73/255, alpha: 1)
    
    static let helpMailRGB = UIColor(red: 55/255, green: 55/255, blue: 56/255, alpha: 1)
    
    static let headerRGB = UIColor(red: 33.0/255, green: 73.0/255, blue: 88.0/255, alpha: 1)
    
    static let titleRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.60)
    
    static let lightBlackRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.37)
    
    static let blackRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    
    static let buttonRGB1 = UIColor(red: 0.0/255, green: 180.0/255, blue: 226.0/255, alpha: 1)
    
    static let buttonRGB2 = UIColor(red: 2.0/255, green: 223.0/255, blue: 193/255, alpha: 1)
    
    static let pageControlRGB = UIColor(red: 0.0/255, green: 184.0/255, blue: 222.0/255, alpha: 1)
    static let pageControlpostRGB = UIColor(red: 48/255, green: 35/255, blue: 174/255, alpha: 1)
    
    static let brightGray = UIColor(red: 255.0/255.0, green: 69.0/255.0, blue: 0.0/255.0, alpha: 1)
    static let whiteTextRGB = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
    static let popUpSuccessRGB = UIColor(red: 42/255.0, green: 195/255.0, blue: 139/255.0, alpha: 1)
    static let lightGrayRGB = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
    static let redRGB =  UIColor(red: 246/255, green: 77/255, blue: 67/255, alpha: 1)
    
    static let darkGrayRGB = UIColor(red: 50.0/255.0, green: 60.0/255.0, blue: 71.0/255.0, alpha: 1)
    
    static let announceRGB1 = UIColor(red: 112.0/255.0, green: 66.0/255.0, blue: 191.0/255.0, alpha: 0.80)
    static let announceRGB2 = UIColor(red: 48.0/255.0, green: 35.0/255.0, blue: 174/255.0, alpha: 0.80)
    
    static let pollRGB1 = UIColor(red: 23.0/255.0, green: 206.0/255.0, blue: 196.0/255.0, alpha: 1)
    static let pollRGB2 = UIColor(red: 8.0/255.0, green: 174.0/255.0, blue: 234.0/255.0, alpha: 1)
    
    static let leaveRGB1 = UIColor(red: 255.0/255.0, green: 131.0/255.0, blue: 8.0/255.0, alpha: 0.75)
    static let leaveRGB2 = UIColor(red: 253.0/255.0, green: 79.0/255.0, blue: 0/255.0, alpha: 0.75)
    
    static let complaintsRGB1 = UIColor(red: 237.0/255.0, green: 98.0/255.0, blue: 154.0/255.0, alpha: 0.95)
    static let complaintsRGB2 = UIColor(red: 200.0/255.0, green: 80.0/255.0, blue: 192/255.0, alpha: 0.95)
    
    static let unselectedColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.42)
    
    static let addComplaintButtonBgr = UIColor(red: 139/255.0, green: 38/255.0, blue: 129/255.0, alpha: 0.80)
    static let addLeaveButtonBgr = UIColor(red: 211/255.0, green: 86/255.0, blue: 27/255.0, alpha: 0.80)
    static let addAnnouncementButtonBgr = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.36)
    static let redColor = UIColor.init(red: 242/255, green: 36/255, blue: 46/255, alpha: 0.9)
    static let lightRedRGB = UIColor.init(red: 255/255, green: 112/255, blue: 82/255, alpha: 1)
    static let cardCellBGR = UIColor(red: 10/255, green: 178/255, blue: 230/255, alpha: 0.0)
    static let cardViewBGR = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    static let blueRGB = UIColor(red: 9 / 255.0, green: 176 / 255.0, blue: 231 / 255.0, alpha: 1.0)
    
    static let lightGreenRGB = UIColor.init(red: 0.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
    
    static let darkGreenRGB = UIColor.init(red: 2.0 / 255.0, green: 220.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0)
    
    static let darkRedRGB = UIColor.init(red: 255/255, green: 10/255, blue: 92/255, alpha: 1)
    
    static let lightRedRGB2 = UIColor(red: 255/255, green: 226/255, blue: 220/255, alpha: 1)
    static let darkRedRGB2 = UIColor.init(red: 236/255, green: 105/255, blue: 96/255, alpha: 1)
    
    static let darkGreenRGB2 = UIColor.init(red: 0.0/255, green: 183.0/255, blue: 224.0/255, alpha: 1)
    
    static let darkYellowRGB = UIColor.init(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
    static let lightYellowRGB = UIColor.init(red: 253/255, green: 237/255, blue: 211/255, alpha: 1)
}


func updateGreeting() -> String {
        
    let dateComponents = Calendar.current.dateComponents([.hour], from: Date())
    var greetingString = ""
    if let hour = dateComponents.hour {
        
        switch hour {
        case 0..<12:
            greetingString = "Good Morning..."
        case 12..<17:
            greetingString = "Good Afternoon..."
        default:
            greetingString = "Good Evening..."
        }
    
    }
    return greetingString
    
}


extension UILabel {
    /**
     This function adding image with text on label.
     */
    func addTextWithImage(text: String, image: UIImage, imageBehindText: Bool, keepPreviousText: Bool) {
        let lAttachment = NSTextAttachment()
        lAttachment.image = image
        
        // 1pt = 1.32px
        let lFontSize = round(self.font.pointSize * 1.32)
        let lRatio = image.size.width / image.size.height
        
        lAttachment.bounds = CGRect(x: 0, y: ((self.font.capHeight - lFontSize) / 2).rounded(), width: lRatio * lFontSize, height: lFontSize)
        
        let lAttachmentString = NSAttributedString(attachment: lAttachment)
        
        if imageBehindText {
            let lStrLabelText: NSMutableAttributedString
            
            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(string: text)
            }
            
            lStrLabelText.append(lAttachmentString)
            self.attributedText = lStrLabelText
        } else {
            let lStrLabelText: NSMutableAttributedString
            
            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(attributedString: lAttachmentString))
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(attributedString: lAttachmentString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            }
            
            self.attributedText = lStrLabelText
        }
    }
    
    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}


class calenderImageView:UIView {
    var image:String?
    let calenderImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "calender"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(imageName:String) {
        super.init(frame: CGRect.zero)
        image = imageName
        calenderImageView.image = UIImage(named: image!)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 176/255, green: 190/255, blue: 197/255, alpha: 1).cgColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        
        self.addSubview(calenderImageView)
        calenderImageView.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        calenderImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:8).isActive = true
        calenderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-8).isActive = true
        calenderImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-8).isActive = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class lineLabel:UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 176/255, green: 190/255, blue: 197/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func getFileSize(data: Data) -> Double{
    let fileSize = data.count
    let sizeMB = ((Double(fileSize) / 1000000) * 100).rounded() / 100
    return sizeMB
}


extension String {
    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
//            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentAttributeKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension UITextField {
    func setPropertiesForTF(placeHolder : String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeHolder
        self.textColor = UIColor.init(red: 50.0/255, green: 60.0/255, blue: 71.0/255, alpha: 1)
        self.backgroundColor = UIColor(red: 251/255, green: 252/255, blue: 253/255, alpha: 1)
        self.font = UIFont.sfDisplayRegular(ofSize: 14)
        self.borderStyle = .roundedRect
        
    }
}

extension UILabel {
    func setPropertiesForLB(placeHolder : String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = placeHolder
        self.textAlignment = .left
        self.numberOfLines = 0
        self.sizeToFit()
        self.font = UIFont.sfDisplayRegular(ofSize: 16)
        self.textColor =  UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        
    }
}

