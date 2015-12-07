//
//  RoutineTVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-07.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:
//
//  Version 0.1 : Rohm Laxton : Created the container, linked through the selected routine

import UIKit

// creates the connection that links to outside of the container
/*
protocol RoutineTVCDelegate{
    func myVCDidFinish(controller:RoutineTVC, value:NSInteger)
    
}*/

class RoutineTVC: UITableViewController {
    //Rohm's code. I don't use it.
    /*
    var selectedIndex : NSInteger?
    
    var delegate : RoutineTVCDelegate? = nil
    
   // these guys call back the value to be referenced in RoutinesVC
    @IBAction func routine1Button(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, value: 0)
        }
    }
        
    @IBAction func routine2Button(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, value: 1)
        }
    }
    */
    
    // MARK: Properties
    
    var delegate: RoutineTVCProtocol?
    
    // Need an array to hold all of the routines.
    var routines = [String]() // What data type does this array hold? Normally I would store Exercise objects in it, this time I store __?
    var routinesUpdated : [[String:String]] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sample
        var index = 0
        while(index < routinesUpdated.count){
                routines.append(routinesUpdated[index]["routineName"]!)
            index++
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select a routine"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routines.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cels are reused and should be dequeued using a cell identifier
        let cellIdentifier = "RoutineCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RoutineCell
        
        // Fetches the appropriate exerecise for the data source layout.
        let routine = routines[indexPath.row]
        
        cell.name.text = routine
        
        return cell
    }
    
    
    //do something when selected, like be made the routine to be used when the user clicks run routine
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let index = indexPath.row // This is the specified row of the table list. Starts from 0, goes to routines.count-1
        //print("You've selected \(routines[index].name).")
        self.delegate?.selectRoutine(routines[index])
    }
    


}

protocol RoutineTVCProtocol {
    func selectRoutine(selectedRoutine: String) -> Void
}