//
//  PopupChooseFontColorViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/8/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class PopupChooseFontColorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionColor: UICollectionView!
    
    
    var tableData = [String]()
    var delegate: FontColorDelegate?
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionColor.collectionViewLayout = layout


        let pathURL = Bundle.main.path(forResource: "ColorPalette", ofType: "plist")!

                 let dict = NSDictionary(contentsOfFile: pathURL)

                let data = dict!.object(forKey: "Colors") as! [String]

         for color in data {
            //print(color)
             tableData.append(color)
         }
      }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let hex = tableData[indexPath.row]
        //    hexStringToUIColor()
            
        cell.backgroundColor = hexStringToUIColor(hex)
        cell.layer.cornerRadius = cell.frame.size.width/2
        cell.clipsToBounds = true
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // print(tableData[indexPath.row])
        delegate?.fontColorShow(color: tableData[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    

}
