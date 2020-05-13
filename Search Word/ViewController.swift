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
    var total_cell = 0
    var pos = 0
    
    @IBOutlet weak var collection_view: UICollectionView!
    
    let grid_size = 10
    let answers = ["SWIFT","IOS","SWIFTUI","CODING"]
    var positionDict: [Int: String] = [:]
    
    let directionPossibilities = ["RL", "LR", "TB", "BT", "TLBR" ,"BRTL","TRBL" , "BLTR"]

    
    private let sectionInsets = UIEdgeInsets(top: 10.0,
    left: 10.0,
    bottom: 0.0,
    right: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionCharaters()
        print(positionDict)
        collection_view.delegate = self
        collection_view.dataSource = self
        // Do any additional setup after loading the view
        
    }
    
    func randomChar() -> String {
      let letters = "abcdefghijklmnopqrstuvwxyz"
      return String((0..<1).map{ _ in letters.randomElement()! })
    }
    
    func randomPosition(length : Int , direction : String) -> Int {
        total_cell = (grid_size * grid_size)-1;
        pos =  Int.random(in: 0...total_cell)
        var x = (pos/grid_size)
        var y = pos - ((x) * grid_size)
        //"RL", "LR", "TB", "BT", "TLBR" ,"BRTL","TRBL" , "BLTR"
        if(direction == "RL" && (y-length) < -1 ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "LR" && (y+length) > grid_size-1 ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "TB" && (x+length) > grid_size-1 ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "BT" && (x-length) < -1 ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "TLBR" && (((x + length) > grid_size-1) || ((y+length) > grid_size-1))) {
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "BRTL" && (((x-length) < -1) || ((y-length) < -1)) ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "TRBL" && (((x+length) > grid_size) || ((y-length) < -1)) ){
            pos = randomPosition(length: length, direction: direction)
        }else if (direction == "BLTR" && (((y+length) > grid_size) || ((x-length) < -1)) ){
            pos = randomPosition(length: length, direction: direction)
        }
        
        for n in 0...length-1 {
            if(direction == "RL"){
                if (positionDict[pos - n] != nil){
                   pos = randomPosition(length: length, direction: direction)
                }
            }else if (direction == "LR"){
               if (positionDict[pos + n] != nil){
                   pos = randomPosition(length: length, direction: direction)
               }
            }else if (direction == "TB"){
               if (positionDict[pos + (n * grid_size)] != nil){
                   pos = randomPosition(length: length, direction: direction)
               }
            }else if (direction == "BT"){
               if (positionDict[pos - (n * grid_size)] != nil){
                   pos = randomPosition(length: length, direction: direction)
               }
            }else if (direction == "TLBR") {
                if (positionDict[pos + (n * grid_size) + n] != nil){
                    pos = randomPosition(length: length, direction: direction)
                }
            }else if (direction == "BRTL"){
                if (positionDict[pos - (n * grid_size) - n] != nil){
                    pos = randomPosition(length: length, direction: direction)
                }
            }else if (direction == "TRBL"  ){
                if (positionDict[pos + (n * grid_size) - n] != nil){
                    pos = randomPosition(length: length, direction: direction)
                }
            }else if (direction == "BLTR"){
                if (positionDict[pos - (n * grid_size) + n] != nil){
                    pos = randomPosition(length: length, direction: direction)
                }
            }
        }
        
        
        return pos
        
    }
    
    func randomDirection() -> String {
        var randomElement = directionPossibilities.randomElement()
        return(randomElement!)
    }
    
    func positionCharaters(){
        for word in answers{
            
            if(word.count > grid_size){
                continue
            }
            
            var direction = randomDirection();
            var position = randomPosition(length: word.count ,direction: direction);
            
            for ch in word{
                positionDict [position] = String(ch)
                var x = (position/grid_size)
                var y = position - ((x) * grid_size)
                
                if(direction == "RL"){
                   position = position - 1
                }else if (direction == "LR"){
                   position = position + 1
                }else if (direction == "TB"){
                   position = position + grid_size
                }else if (direction == "BT"){
                   position = position - grid_size
                }else if (direction == "TLBR") {
                   position = position + grid_size + 1
                }else if (direction == "BRTL"){
                   position = position - grid_size - 1
                }else if (direction == "TRBL"  ){
                   position = position + grid_size - 1
                }else if (direction == "BLTR"){
                   position = position - grid_size + 1
                }
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
        
        return grid_size * grid_size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCellController
        
        let keyExists = positionDict[indexPath.row] != nil

        if keyExists{
            cell.celllabel?.text = positionDict[indexPath.row]
        } else {
          cell.celllabel?.text = randomChar()
        }
        
        return cell
        
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = CGFloat(grid_size + 1) * sectionInsets .left
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(grid_size)

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
