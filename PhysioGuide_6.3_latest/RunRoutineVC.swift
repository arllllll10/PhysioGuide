//
//  RunRoutineVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:
//  Version 0.1 : Rohm Laxton : Created a view controller and implimented the
//  routine acceptance from previous screen.
//  Version 0.2 : Thomas Breen : Added some logic for determining what to do at each element in the routine array. Need to load the routine from server before this will run.

import UIKit
import YouTubePlayer

class RunRoutineVC: UIViewController {
    @IBOutlet weak var YoutubePlayer: YouTubePlayerView!
    @IBOutlet weak var playButton: UIButton!
    
    var routineName: String! // Gets defined in the prepareForSegue function in RoutinesVC. Use this string to load the exercises with the server.
    
    var index = 0 // The index used to select elements in the routine array.
    var routine = [Exercise]() // Can use this array to store the exercises if we're going that route.
    var routinesUpdated : [[String:String]] = []
    var routineRef : Int = 0
    
    let exerciseDict: [String:String] = ["1" : "Back Extensions", "2" : "Biceps Curl", "3" : "Calf Raise", "4" : "Cat Stretch", "5" : "Crunch", "6" : "Front and Back Neck Stretch", "7" : "Back Hyperextensions", "8" : "Jogging", "9" : "Jumping Jacks", "10" : "Knees to Chest", "11" : "Lateral Raise", "12" : "Leg Raises", "13" : "Lunges", "14" : "Modified Hurdler's Stretch", "15" : "Push-ups", "16" : "Quadriceps", "17" : "Reclined Hamstrings", "18" : "Runner's Lunge", "19" : "Russian Twist", "20" : "Shoulders Overhead", "21" : "Shoulders Posterior", "22" : "Shoulder Shrugs", "23" : "Side Hip Abductor", "24" : "Side Lunge", "25" : "Side Neck", "26" : "Side Trunk", "27" : "Spinal Twist", "28" : "Squats", "29" : "Upright Row", "30" : "Wall Calf Stretch"]
    
        let exMetricDict: [String:String] = ["1" : "none", "2" : "Pounds", "3" : "none", "4" : "none", "5" : "Count", "6" : "none", "7" : "Pounds", "8" : "Duration", "9" : "none", "10" : "none", "11" : "Pounds", "12" : "none", "13" : "Pounds", "14" : "none", "15" : "Count", "16" : "none", "17" : "none", "18" : "none", "19" : "Pounds", "20" : "none", "21" : "none", "22" : "Pounds", "23" : "none", "24" : "none", "25" : "none", "26" : "none", "27" : "none", "28" : "Pounds", "29" : "Pounds", "30" : "none"]
    
    
    //let's make a sample routine.
    // ***** Sample ******
    func loadSampleExercises() {
        //make for loop to grab all exercises from server and include them to the exercises array

        
        var index1 = 0
        //determine my routine number
        while(index1 < routinesUpdated.count)
        {
            if(routineName == routinesUpdated[index1]["routineName"]){
                routineRef = index1
            }
            index1++
        }
        
        var index2 = 1
        while(index2 < 21 && routinesUpdated[routineRef]["exID\(index2)"] != "0")
        {
            let myExercise : String! = exerciseDict[routinesUpdated[routineRef]["exID\(index2)"]!]
            print("printing out my current exercise name: \(myExercise)")

            
            let exerciseN = Exercise(name: myExercise, link: "www.youtube.com/something")
            //Exercise(name: exerciseDict[routinesUpdated[routineRef]["exID\(index2)"]!]!, link: "")
            routine.append(exerciseN!)
            index2++
        }
        
        /*
        //let icon1 = UIImage(named: "Squat")
        let exercise1 = Exercise(name: "Squat", link: "10yQ6m7w__E")!
        
        //let icon2 = UIImage(named: "bicepsCurl")
        let exercise2 = Exercise(name: "Biceps Curl", link: "nj4qeipu6ic")!
        
        //let icon3 = UIImage(named: "CalfRaise")
        let exercise3 = Exercise(name: "Jogging", link: "YF_OLR7tC70")!
        
        routine += [exercise1, exercise2, exercise3]*/
    }
    // ***** Sample ******
    
    
    @IBOutlet weak var VideoInRoutine: YouTubePlayerView!
    @IBOutlet weak var currIcon: UIImageView!
    @IBOutlet weak var currName: UILabel!
    var currLink: String!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextName: UILabel!
    
    //metric UI elements
    @IBOutlet weak var metricName: UILabel!
    @IBOutlet weak var metricValue: UILabel!
    @IBOutlet weak var smallInc: UIButton!
    @IBOutlet weak var largeInc: UIButton!
    @IBOutlet weak var smallDec: UIButton!
    @IBOutlet weak var largeDec: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metricValue.text = "0"
        
        loadSampleExercises() // Comment this out or delete when we can fetch the routines from the server.
        let e = routine[index]
        let link = e.link
        YoutubePlayer.loadVideoID(link)
        
        metricName.hidden = true
        metricValue.hidden = true
        smallInc.hidden = true
        largeInc.hidden = true
        smallDec.hidden = true
        largeDec.hidden = true
        
        //load in the routine from server. This below is pseudo-code kind of to help me think. It can be removed once it is done properly.
        /*
        for exercise in serverArray {
        let e = Exercise(name: exercise.name, icon: UIImage(named: exercise.name), link: exercise.link)!
        routine.append[e]
        }
        */
        //finished loading
        
        // Load the information for the inital and next exercise.
        updateInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func largeIncA(sender: AnyObject) {
        var val : Int = Int(metricValue.text!)!
        val += 5
        metricValue.text = String(val)
    }

    @IBAction func smallincA(sender: AnyObject) {
        var val : Int = Int(metricValue.text!)!
        val += 1
        metricValue.text = String(val)
    }
    
    @IBAction func smallDeCA(sender: AnyObject) {
        var val : Int = Int(metricValue.text!)!
        val -= 1
        if(val < 0)
        {
            val = 0
        }
        metricValue.text = String(val)
    }
    
    @IBAction func largeDecA(sender: AnyObject) {
        var val : Int = Int(metricValue.text!)!
        val -= 5
        if(val < 0)
        {
            val = 0
        }
        metricValue.text = String(val)
    }
    
    @IBAction func next(sender: UIButton) {
        
        if(currName.text == "Jogging")
        {
            let jC = JoggingCalc()
            let val : Int = Int(metricValue.text!)!
            let calsBurned : String = String(jC.calcCalories(val))
            let calsBurnedDoub : Double = Double(metricValue.text!)!
            let currentDate = NSDate()
            
            let hk = HealthManager()
            
            hk.saveCalorySample(calsBurnedDoub, date: currentDate, dur: val)
            
            var state : Int = -1
            let calSend = Calories()
            calSend.addCalories(calsBurned, completionHandler: { value in
                state = value
                //print("something  \(state)")
                if state == 0 {
                    print("Server rejected connection")
                    return
                } else if(state == 1){
                    //self.saveName(user)
                    print("Server accepted connection")
                    return
                }
                else {
                    print("No response from server")
                }
            })
 
            
        }
        
        //let Routines : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("RoutinesVC")
        
        
        index++ //Go to the next exercise in the routine.
        if index < routine.count { // Don't try to update if we're out of bounds.
            updateInfo()
            
            let e = routine[index]
            let link = e.link
            
            YoutubePlayer.loadVideoID(link)
            YoutubePlayer.hidden = true
            YoutubePlayer.clear() // Supposedly stops and clears the youtube player's screen. Unfortunately it doesn't kill the player hmm..
            playButton.hidden = false
            
            
        } else { // If we are out of bounds that means the Finish button was clicked, so return to the RunRoutines view controller.
            //self.showViewController(Routines as! UIViewController, sender: Routines)
            
            
            let mainSB = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainSB.instantiateViewControllerWithIdentifier("MainMenuVC")
            self.navigationController!.pushViewController(vc,animated:true)
        }
    }
    
    @IBOutlet weak var testingSpeed: UIButton!
    @IBOutlet weak var stopTesting: UIButton!
    
    func updateInfo() {
        currIcon.image = routine[index].icon
        currName.text = routine[index].name
        let id = routine[index].id
        if(exMetricDict[id!] != "none")
        {
            metricName.hidden = false
            metricValue.hidden = false
            smallInc.hidden = false
            largeInc.hidden = false
            smallDec.hidden = false
            largeDec.hidden = false
            metricName.text = exMetricDict[id!]
            metricValue.text = "0"
        }else {
            metricName.hidden = true
            metricValue.hidden = true
            smallInc.hidden = true
            largeInc.hidden = true
            smallDec.hidden = true
            largeDec.hidden = true
        }
        if (exerciseDict[id!] != "Biceps Curl"){
            testingSpeed.hidden = true
            stopTesting.hidden = true
        }else{
            testingSpeed.hidden = false
            stopTesting.hidden = false
        }
       
        
        currLink = routine[index].link
        self.title = routineName
        if index >= routine.count-1 { // The array starts at 0 and has routine.count elements. When it reaches element routine.count-1, the next element is out of bounds.
            // Then there is no next exercise.
            nextName.text = ""
            nextButton.setTitle("Finish", forState: .Normal)
        } else {
            nextName.text = routine[index+1].name
        }
    }
    
    
    //     e.g. there is an array OR dictionary
    //    then can use a for loop to change imageForCurrentExercise, NameForCurrentExercise,NextExerciseName
    //    but first need get size , e.g. n
    //
    //the name of icon should be the same as labelText (for convienience)
    //    for (var i = 0; i < n; i++){
    //        VideoInRoutine.loadVideoID(linkString[i])
    //        VideoInRoutine.play()
    //        NameForCurrentExercise.text = labelText[i]
    //        imageForCurrentExercise.image= UIImage(named: labelText[i])
    //        if (i != (n-1))
    //            NextExerciseName.text= labelText[i+1]
    //        else
    //            NextExerciseName.text= "This is your last one!"
    //    }
    //
    
    @IBAction func playvid(sender: AnyObject) {
        
        //YoutubePlayer.loadVideoID(link) // Don't need to load the video when this is selected as it has already started loading in viewDidLoad() or next()
        YoutubePlayer.play()
        YoutubePlayer.hidden = false
        playButton.hidden = true
    }
    
    
    // @IBOutlet weak var timerLabel: UILabel!
    let temp :AccelerationClass = AccelerationClass()
    var timerCount = 0
    var timer = NSTimer()
    var timerRunning = false
    
    @IBAction func StartCountingSpeed(sender: UIButton) {
        let currentAccx1 = temp.accX
        
        if (timerRunning == false){
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
            temp.getValue()
            let currentAccx2 = temp.accX
            print("flows to here")
            if (timerCount < 3  &&  fabs(currentAccx2 - currentAccx1) > 0.9 ){
                self.displayAlertMessage ("you moves too fast")
                print ("lalala")
            }
        }
        
    }
    
    @IBAction func StopTestingSpeed(sender: UIButton) {
        if (timerRunning == true){
            timer.invalidate()
            timerRunning = false
        }
    }
    
    func counting(){
        timerCount += 1
        //timerLabel.text = "\(timerCount)"
    }
    //message to tell user hold phone in hand
    func displayAlertMessageNotice(UserMessage :String)
    {
        let alert = UIAlertController (title: "Notice!", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Copy That", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
    //message too tell user to fast or too slow
    func displayAlertMessage(UserMessage :String)
    {
        let alert = UIAlertController (title: "Alert", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Copy That", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
}

