//
//  AccountCreationVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit

class AccountCreationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var UsernameUITextField: UITextField!
    @IBOutlet weak var passwordUItextField: UITextField!
    @IBOutlet weak var ConfirmPasswordUITextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UsernameUITextField.delegate = self
        passwordUItextField.delegate = self
        ConfirmPasswordUITextField.delegate = self
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
        let user=UsernameUITextField.text!
        let pass=passwordUItextField.text!
        let confirmpassword=ConfirmPasswordUITextField.text!
        let accountClass = Account()
    
        //check for empty information
        if (user.isEmpty || pass.isEmpty || confirmpassword.isEmpty )
        { //display alert to tell user fill in the information
            displayAlertMessage ("All fields are required")
            return
        }
    
        //check password confirmation
        if (pass != confirmpassword)
        {   //display alert
            displayAlertMessage ("Password confirmation failed")
            return
        }
        
        if (pass == confirmpassword && !user.isEmpty)
        {
            var state : Int = -1
            let mm : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC")
            LocalSave.sharedLocalSave.localUser = user
            
            accountClass.addUser(user, password: pass, completionHandler: { added in
                state = added
                if state == 0 {
                    self.displayAlertMessage ("Username exists")
                    return
                } else if(state == 1){
                    self.showViewController(mm as! UIViewController, sender: mm)
                    return
                }
                else {
                    self.displayAlertMessage("No response from server")
                }
            })
            
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
        if range.length + range.location > UsernameUITextField.text!.characters.count{
            return false
        }
        let NewLength = UsernameUITextField.text!.characters.count + string.characters.count - range.length
        return NewLength<=10
    }

}
