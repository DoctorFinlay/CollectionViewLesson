//
//  CustomCollectionCell.swift
//  CollectionViewPractice
//
//  Created by Iain Coleman on 05/03/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iV: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    
    func configureCell(cellModel: SimplePhoto) {
        
        do {
            if let imageUrl = URL(string: cellModel.url) {
                let imageData: Data = try Data(contentsOf: imageUrl)
                iV.image = UIImage(data: imageData)
            }
        } catch {
            debugPrint(error)
        }
        cellLbl.text = cellModel.desc
    }
    
    
    
}
