//
//  ViewController.swift
//  Search Word
//
//  Created by Rajwinder Kaur on 2020-05-09.
//  Copyright © 2020 Rajwinder Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
var count = 0
    @IBOutlet weak var collection_view: UICollectionView!
    let gird_size = 5
    let answers = ["Swift","Ios", "Coding", "SwiftUI"]
    
    let directionPossibilities = ["RL", "LR", "TB", "BT", "TLBR" ,"BRTL","TRBL" , "BLTR"]

    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
    left: 10.0,
    bottom: 0.0,
    right: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view.delegate = self
        collection_view.dataSource = self
        // Do any additional setup after loading the view
        positionCharaters()
    }
    
    func randomChar() -> String {
      let letters = "abcdefghijklmnopqrstuvwxyz"
      return String((0..<1).map{ _ in letters.randomElement()! })
    }
    
    func randomPosition(length : Int , direction : String) -> Int {
        var total_cell = (gird_size * gird_size);
        var pos =  Int.random(in: 0...total_cell )
        var x = (pos/gird_size)
        var y = pos - ((x) * gird_size)
        //"RL", "LR", "TB", "BT", "TLBR" ,"BRTL","TRBL" , "BLTR"
        
        return pos
    }
    
    func randomDirection() -> String {
         var randomElement = directionPossibilities.randomElement()
        return(randomElement!)
    }
    
    func positionCharaters(){
        for a in answers {
            var direction = randomDirection();
            var position = randomPosition(length: a.count ,direction: direction);
            
            
            
            print(position ,  direction)
            
            
//            switch randomDirection {
//            case 1:
//
//            case 2:
//
//            case 3:
//
//            case 4:
//
//
//
//            default:
//                <#code#>
//            }
            for ch in a{
              
            }
        }
    }
    
    
}
extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath);
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gird_size * gird_size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCellController
        cell.celllabel?.text = String(count)
        count = count + 1
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

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         insetForSectionAt section: Int) -> UIEdgeInsets {
       return sectionInsets
     }
     

     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return sectionInsets.left
     }
}
