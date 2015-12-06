//
//  StatsVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit

class StatsVC: UIViewController {
    
    var myCalorieData : [[String:String]] = []
    var calorieShell : [String:String] = ["username" : "", "calorie" : "", "date": ""]
    var calList: [Int]!
    
    @IBOutlet weak var maxValue: UILabel!
    @IBOutlet weak var minValue: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    
    var labels : [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels.append(firstLabel)
        labels.append(secondLabel)
        labels.append(thirdLabel)
        labels.append(fourthLabel)
        labels.append(fifthLabel)
        // Do any additional setup after loading the view, typically from a nib.
        setupGraphDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    routine.retrieveRoutines(myUser, completionHandler: { swiftyJsonVar in
    self.arrData = swiftyJsonVar
    //print("something  \(state)")
    print(self.arrData)
    print(self.arrData.count)
    for thingy in swiftyJsonVar
    {
    let aRoutine = thingy.1
    //print(aRoutine)
    for subThingy in aRoutine
    {
    self.routineDict[subThingy.0] = subThingy.1.string
    
    }
    self.myRoutines.append(self.routineDict)
    
    }
    
    // myRoutines[0] - myRoutines[myRoutines.count-1] contains all of the routine lists
    //print("Total lines in \(self.myRoutines[0]["routineName"]!)")
    })*/
    
    func setupGraphDisplay() {
        
        let calorieClass = Calories()
        calorieClass.getCalories(LocalSave.sharedLocalSave.localUser!, completionHandler:
            { swiftyJsonVar in
                
                for thingy in swiftyJsonVar
                {
                    let aCalData = thingy.1
                    //username
                    //calorie
                    //date
                    
                    for subThingy in aCalData
                    {
                        self.calorieShell[subThingy.0] = subThingy.1.string
                    }
                    self.myCalorieData.append(self.calorieShell)
                }
                print(self.myCalorieData)
                
                
                var cals : [Int] = []
                var index = 0
                var updateNum = 0
                while(index < self.myCalorieData.count)
                {
                    if(self.myCalorieData[index]["date"] != "")
                    {
                        var dateString = self.myCalorieData[index]["date"]
                        let range1 = dateString!.startIndex..<dateString!.startIndex.advancedBy(5)
                        dateString!.removeRange(range1)
                
                        let range2 = dateString!.startIndex.advancedBy(5)..<dateString!.endIndex
                        dateString!.removeRange(range2)
                    
                        self.labels[index].text = dateString!
                    }
                    
                    
                    if(self.myCalorieData[index]["calorie"] != "")
                    {
                        let someNum : Int? = Int(self.myCalorieData[index]["calorie"]!)
                        cals.append(someNum!)
                        updateNum++
                    }
                    

                    index++
                    
                }
                if(updateNum > 0)
                {
                    self.maxValue.text = "\(cals.maxElement()!)"
                    self.minValue.text = "\(cals.minElement()!)"
                }
        })
        
        
        
        
        
        
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
            destController.calList = 
        
        
    }*/
    
    
}
