//
//  AcademicInfoCell.swift
//  SpaceBasic
//
//  Created by Kashee ram on 9/5/19.
//  Copyright © 2019 Smaat. All rights reserved.
//

import UIKit

class AcademicInfoCell: CollectionBaseCell {
    
    lazy var registrationIdTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 125
        textField.setTextFiledProperties(placeHolder:"Registraion ID")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var courseTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 126
        textField.setTextFiledProperties(placeHolder:"Course Name *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var streamTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 127
        textField.setTextFiledProperties(placeHolder:"Stream *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var joiningYearTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 128
        textField.setTextFiledProperties(placeHolder:"Joining Year")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var currentYearTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 129
        textField.setTextFiledProperties(placeHolder:"Current Year")
        textField.setBottomBorder()
        return textField
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        setupUI()
    }
    
    func setupUI(){
        
        [registrationIdTextFiled, courseTextFiled, streamTextFiled].forEach({ addSubview($0) })
        
        registrationIdTextFiled.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 44))
        
        courseTextFiled.anchor(top: registrationIdTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
        streamTextFiled.anchor(top: courseTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 44))
        
        let academicStack = UIStackView(arrangedSubviews: [joiningYearTextFiled, currentYearTextFiled])
        academicStack.distribution = .fillEqually
        academicStack.spacing = 16
        academicStack.axis = .horizontal
        addSubview(academicStack)
        
        academicStack.anchor(top: streamTextFiled.bottomAnchor, leading: streamTextFiled.leadingAnchor, bottom: bottomAnchor, trailing: streamTextFiled.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 8, right: 0), size: .init(width: 0, height: 44))
        
    }
}
