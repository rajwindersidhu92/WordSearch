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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(1)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCellController
        cell.celllabel?.text = "a"
        return cell
    }
        

}

