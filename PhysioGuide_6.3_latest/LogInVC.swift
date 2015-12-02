//
//  LogInVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit

class LogInVC: UIViewController, UITextFieldDelegate {
    //Mark: Propertities
    @IBOutlet weak var usernameUITextField: UITextField!
    @IBOutlet weak var passwardUITextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        passwardUITextField.delegate = self
        usernameUITextField.delegate = self
    }
    //Dismiss keyboard for UITestField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ExitKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    var arrayOfUsername: [String] = ["arlene", "rohm", "scott","thomas"]
    var arrayOfPassword: [String] = ["arlene", "rohm", "scott","thomas"]
    
    
    @IBAction func LogInButtom(sender: AnyObject) {
        let user=usernameUITextField.text!
        let pass=passwardUITextField.text!
        let accountClass = Account();
        //var count = 0;
        let mm : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC")
        
        
        
        //check for empty information
        if (user.isEmpty || pass.isEmpty)
        { //display alert to tell user fill in the information
            displayAlertMessage ("All fields are required")
            return
        }
        
        if(!(user.isEmpty) && !(pass.isEmpty))
        {
            var state: Int = -1
            
            // calls to Account, asks if the username and password match a record in the database
            // pushes to the Main Menu if successful
            accountClass.checkPassword(user, password: pass, completionHandler:  { value in
                 state = value
                 //print("something  \(state)")
                if state == 0 {
                    self.displayAlertMessage ("Username or password failed")
                    return
                } else if(state == 1){
                    self.showViewController(mm as! UIViewController, sender: mm)
                    return
                }
                else {
                    self.displayAlertMessage("No response from server")
                }
            })
            
            /*while(state == -1 && count < 10)
            {
                count++
                print(count)
                print("state is")
                print(state)
                if state == 0 {
                    displayAlertMessage ("username or password failed")
                    return
                } else if(state == 1){
                    print("show next page")
                    return
                }
                else {
                    print("repeating")
                }
            }*/
            
        }
        
    }
    
    func displayAlertMessage(UserMessage :String)
    {
        let alert = UIAlertController (title: "Alert", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Copy That", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > usernameUITextField.text!.characters.count{
            return false
        }
        let NewLength = usernameUITextField.text!.characters.count + string.characters.count - range.length
        return NewLength<=10
    }
    
    
}