//
//  CurrentRoutine.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-21.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit


class CurrentRoutineVC: UIViewController {//, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let iconArray = [UIImage(named: "Biceps Curl"), UIImage(named: "Calf Raise"), UIImage(named: "Lateral Raise"), UIImage(named: "Lunge")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func collectionView (collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iconArray.count
    }
    
    func collectionView (collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CurrentRoutineCell
        
        cell.icon?.image = iconArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectIteAtIndexPath indexPath: NSIndexPath)
    {
        //do something when it is selected
    }
    */
    
    
}