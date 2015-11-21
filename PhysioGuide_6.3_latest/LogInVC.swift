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
        let username=usernameUITextField.text!
        let password=passwardUITextField.text!
        
        //check for empty information
        if (username.isEmpty || password.isEmpty)
        { //display alert to tell user fill in the information
            displayAlertMessage ("All fields are required")
            return
        }
        if(arrayOfUsername.contains(username))
        {
            if( arrayOfUsername.indexOf(username) != arrayOfPassword.indexOf(password))
            {   // Login is successfull
                displayAlertMessage ("username or password failed")
                return
            }
        }
        if (!arrayOfUsername.contains(username)){
            displayAlertMessage ("username or password failed")
            return}
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