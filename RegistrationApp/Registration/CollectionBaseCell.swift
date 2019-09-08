//
//  CollectionBaseCell.swift
//  SpaceBasic
//
//  Created by kashee on 26/12/18.
//  Copyright © 2018 Smaat. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
