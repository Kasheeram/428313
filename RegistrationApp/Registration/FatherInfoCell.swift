//
//  FatherInfoCell.swift
//  SpaceBasic
//
//  Created by Kashee ram on 9/5/19.
//  Copyright © 2019 Smaat. All rights reserved.
//

import UIKit

class FatherInfoCell: CollectionBaseCell {
    
    lazy var fatherNameTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 101
        textField.setTextFiledProperties(placeHolder:"Father Name *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var occupationTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 102
        textField.setTextFiledProperties(placeHolder:"Occupation")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var emailTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 103
        textField.setTextFiledProperties(placeHolder:"Email *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var countryCodeTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 104
        textField.setTextFiledProperties(placeHolder:"(+91)")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var phoneTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 105
        textField.setTextFiledProperties(placeHolder:"9876543210")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var addressTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 106
        textField.setTextFiledProperties(placeHolder:"Address *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var cityTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 107
        textField.setTextFiledProperties(placeHolder:"City *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var pinTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 108
        textField.setTextFiledProperties(placeHolder:"Pin *")
        textField.setBottomBorder()
        return textField
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        setupUI()
        setupToolBar()
    }
    
    func setupToolBar() {
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
        numberToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelNumberPad)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneWithNumberPad))]
        numberToolbar.sizeToFit()
        fatherNameTextFiled.inputAccessoryView = numberToolbar
        occupationTextFiled.inputAccessoryView = numberToolbar
        emailTextFiled.inputAccessoryView = numberToolbar
        countryCodeTextFiled.inputAccessoryView = numberToolbar
        phoneTextFiled.inputAccessoryView = numberToolbar
        addressTextFiled.inputAccessoryView = numberToolbar
        cityTextFiled.inputAccessoryView = numberToolbar
        pinTextFiled.inputAccessoryView = numberToolbar
    }
    
    @objc func cancelNumberPad() {
        //Cancel with number pad
    }
    @objc func doneWithNumberPad() {
        //Done with number pad
        self.endEditing(true)
    }
    
    func setupUI(){
       
        [fatherNameTextFiled, occupationTextFiled, emailTextFiled, countryCodeTextFiled, phoneTextFiled, addressTextFiled, cityTextFiled, pinTextFiled].forEach({ addSubview($0) })
        
        fatherNameTextFiled.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 44))
        
        occupationTextFiled.anchor(top: fatherNameTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
        emailTextFiled.anchor(top: occupationTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        countryCodeTextFiled.anchor(top: emailTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 60, height: 44))
        
        phoneTextFiled.anchor(top: emailTextFiled.bottomAnchor, leading: countryCodeTextFiled.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        addressTextFiled.anchor(top: phoneTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
         pinTextFiled.anchor(top: addressTextFiled.bottomAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 8, right: 0), size: .init(width: 90, height: 44))
        
        cityTextFiled.anchor(top: pinTextFiled.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: pinTextFiled.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 8, right: 16),size: .init(width: 0, height: 44))
        
       
        
    }
}
