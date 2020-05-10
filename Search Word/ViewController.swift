//
//  ViewController.swift
//  Search Word
//
//  Created by Rajwinder Kaur on 2020-05-09.
//  Copyright © 2020 Rajwinder Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var collection_view: UICollectionView!
    let gird_size = 15
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
    left: 10.0,
    bottom: 0.0,
    right: 0.0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collection_view.delegate = self
        collection_view.dataSource = self
        // Do any additional setup after loading the view
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath);
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gird_size * gird_size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCellController
        cell.celllabel?.text = "a"
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let paddingSpace = CGFloat(gird_size + 1) * sectionInsets .left
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / CGFloat(gird_size)
    print(CGFloat(gird_size))
    print(CGFloat(paddingSpace))
    print(CGFloat(view.frame.width))
    print(availableWidth
    )
    print(widthPerItem
    )
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
    func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         insetForSectionAt section: Int) -> UIEdgeInsets {
       return sectionInsets
     }
     
     // 4
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return sectionInsets.left
     }
}
