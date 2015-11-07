//
//  LogInVC.swift
//  PhysioGuide_6.3_latest
//
//  Created by Thomas Breen on 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//

import UIKit

class LogInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
    }
    
    //function to hide keyboard when user presses return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //hide the keyboard when the user touches somewhere other than a text field
    @IBAction func exitKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

