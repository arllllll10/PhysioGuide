//
//  AccountCreationVC.swift
//  PhysioGuide_6.3_latest
//
//  Created by Thomas Breen on 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//

import UIKit

class AccountCreationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var UsernameUITextField: UITextField!
    @IBOutlet weak var passwordUItextField: UITextField!
    @IBOutlet weak var ConfirmPasswordUITextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dismiss keyboard for UITestField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func ExitKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func SignUpButton(sender: AnyObject)
    {
        let username=UsernameUITextField.text
        let password=passwordUItextField.text
        let confirmpassword=ConfirmPasswordUITextField.text
    
        //check for empty information
        if (username.isEmpty || password.isEmpty || confirmpassword.isEmpty )
        { //display alert to tell user fill in the information
            displayAlertMessage ("All fields are required")
            return
        }
    
        //check password confirmation
        if (password != confirmpassword)
        {   //display alert
            displayAlertMessage ("Password confirmation failed")
            return
        }
    }
    
    func displayAlertMessage(UserMessage :String)
    {
        var alert = UIAlertController (title: "Alert", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Copy That", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > count(UsernameUITextField.text){
            return false
        }
        let NewLength = count(UsernameUITextField.text) + count(string) - range.length
        return NewLength<=10
    }

}
