//
//  TitleView.swift
//  CollectionViewPractice
//
//  Created by Iain Coleman on 05/03/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class TitleView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var categoryTitle: String! {
        didSet {
            titleLabel.text = categoryTitle
        }
    }
    
    
}
