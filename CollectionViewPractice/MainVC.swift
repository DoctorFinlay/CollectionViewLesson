//
//  MainVC.swift
//  CollectionViewPractice
//
//  Created by Iain Coleman on 05/03/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var array1: [SimplePhoto]!
    var array2: [SimplePhoto]!
    var combinedArray: NSMutableArray! //This combines the section arrays
    
    override func viewDidLoad() {
        
        let photo1 = SimplePhoto(url: "http://placehold.it/600/467562", desc: "This is photo1")
        let photo2 = SimplePhoto(url: "http://placehold.it/600/467562", desc: "This is photo2")
        let photo3 = SimplePhoto(url: "http://placehold.it/600/467562", desc: "This is photo3")
        
        array1 = [photo1, photo2, photo3]
        array2 = [photo1, photo2, photo3]
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        APIService.instance.getPhotos { (success) in
//            if success {
//                //self.array1 = APIService.instance.array1
//                self.array1 = Array(APIService.instance.array1.prefix(5))
//                self.array2 = Array(APIService.instance.array2.prefix(5))
//                self.collectionView.reloadData()
//            } else {
//                print("Nope!")
//            }
//        }
        
        combinedArray = NSMutableArray(array: [array1, array2])
        
        super.viewDidLoad()

        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return titleArray.count
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (combinedArray.object(at: section) as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionCell
        
        if(indexPath.section == 0) {
             cell.configureCell(cellModel: array1[indexPath.item])
        } else {
            cell.configureCell(cellModel: array2[indexPath.item])
        }
        
       
        
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var titleView: UICollectionReusableView? = nil
        if(kind == UICollectionElementKindSectionHeader) {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "titleHeaderView", for: indexPath) as! TitleView
            view.titleLabel.text = titleArray[indexPath.section]
            titleView = view
        }
        return titleView!
        
    }
    
    let titleArray: [String] = ["First title", "Second title"]

}
