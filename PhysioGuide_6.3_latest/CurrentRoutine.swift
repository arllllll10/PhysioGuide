//
//  CurrentRoutine.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-21.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit


class CurrentRoutineVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //@IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let myArray = ["item1", "item2", "item3", "item4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //how to make them viewed?
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView (collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myArray.count
    }
    
    func collectionView (collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.titleLabel?.text = self.myArray[indexPath.row]
        
        return cell
    }
    
    
    
    
}