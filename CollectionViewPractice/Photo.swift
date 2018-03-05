//
//  CellModel.swift
//  CollectionViewPractice
//
//  Created by Iain Coleman on 05/03/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
}
