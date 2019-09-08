//
//  HostelInfoCell.swift
//  SpaceBasic
//
//  Created by Kashee ram on 9/5/19.
//  Copyright © 2019 Smaat. All rights reserved.
//

import UIKit

class HostelInfoCell: CollectionBaseCell {
    
    lazy var hostelNameTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 130
        textField.setTextFiledProperties(placeHolder:"Hostel Name *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var blockNameTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 131
        textField.setTextFiledProperties(placeHolder:"Block *")
        textField.setBottomBorder()
        return textField
    }()
    
    lazy var roomNumberTextFiled:UITextField = {
        let textField = UITextField()
        textField.tag = 132
        textField.setTextFiledProperties(placeHolder:"Room *")
        textField.setBottomBorder()
        return textField
    }()
    
    override func setupViews() {
        super.setupViews()
        
        setupUI()
    }
    
    func setupUI(){
        
        [hostelNameTextFiled, blockNameTextFiled, roomNumberTextFiled].forEach({ addSubview($0) })
        
        hostelNameTextFiled.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 44))
        
        blockNameTextFiled.anchor(top: hostelNameTextFiled.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 44))
        
        roomNumberTextFiled.anchor(top: blockNameTextFiled.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 8, right: 0), size: .init(width: 0, height: 44))
       
    }
}
