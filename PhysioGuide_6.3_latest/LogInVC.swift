//
//  LogInVC.swift
//  PhysioGuide_6.3_latest
//
//  Created by Thomas Breen on 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//

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
    
    
    var arrayOfUsername: [String] = ["arlene", "rohn", "scott","thomas"]
    var arrayOfPassword: [String] = ["arlene", "rohn", "scott","thomas"]

    
    @IBAction func LogInButtom(sender: AnyObject) {
        let username=usernameUITextField.text
        let password=passwardUITextField.text
        
        //check for empty information
        if (username.isEmpty || password.isEmpty)
        { //display alert to tell user fill in the information
            displayAlertMessage ("All fields are required")
            return
        }
        if(contains(arrayOfUsername,username))
        {
            if( find(arrayOfUsername,username) != find(arrayOfPassword,password))
            {   // Login is successfull
                displayAlertMessage ("username or password failed")
                return
            }
        }
        if (!contains(arrayOfUsername, username)){
            displayAlertMessage ("username or password failed")
            return}
    }
    
    func displayAlertMessage(UserMessage :String)
    {
        var alert = UIAlertController (title: "Alert", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Copy That", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > count(usernameUITextField.text){
            return false
        }
        let NewLength = count(usernameUITextField.text) + count(string) - range.length
        return NewLength<=10
    }
    
    
}