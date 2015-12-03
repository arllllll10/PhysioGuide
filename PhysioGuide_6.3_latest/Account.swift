//
//  Account.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-13.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Version 0.1 : Rohm Laxton : Defining the Account class to handle the
//  different error checks.

import Foundation
import Alamofire
import SwiftyJSON

class Account{
    
    /*var identity: [String:AnyObject] = [
    "username": "something",
    "password": "something"
    ]*/
    var arrRes = [String:AnyObject]()
    var something = [String:AnyObject]()
    
    //var count : Int  = 0
    
   
    
    
    
    // vars i can't think of at the moment
    
    // func checkUsername(username : String) -> bool
    // check if the current username exists, return a bool
    // for "invalid username test" and account creation
    
    
    // Rohm - Pings the server and checks if the username and password exist. THE CULMINATION OF 5 DAYS OF DATABASE, SERVER, PHP, JSON TORTURE. YES, OH GOD YES.
    func checkPassword(username : String, password : String, completionHandler: (Int) -> Void)
    {
        
        print(username + password)
        let identity: [String:String] = ["username":username , "password":password];
        
        
        Alamofire
            .request(.POST, "http://52.27.94.207/checkUser.php", parameters : identity, encoding: ParameterEncoding.URL)
            .validate()
            .responseJSON {
                (responseData) in
                
                        let swiftyJsonVar = JSON(responseData.result.value!)
                        let value = swiftyJsonVar["status"].int!
                
                
                
                            if swiftyJsonVar["status"].int! == 1 {
                                print("Autheticated")
                                
                                //return
                            }else if swiftyJsonVar["status"].int! == 0
                            {
                                print("Not authenticated")
                            }else {
                                print("no reply")
                            }
                        completionHandler(value)
                    }
        
                
                
                
    }
        

    func addUser(username : String, password: String, completionHandler: (Int) -> Void)
    {
        print(username + password)
        let identity: [String:String] = ["username": username , "password" : password]
        
        Alamofire
            .request(.POST, "http://52.27.94.207/insert.php", parameters : identity, encoding: ParameterEncoding.URL)
            .validate()
            .responseJSON {
                (responseData) in
                    let swiftyJsonVarAdded = JSON(responseData.result.value!)
                    let added = swiftyJsonVarAdded["status"].int!
                
                if added == 1 {
                    print("Added to db")
                } else if added == 0 {
                    print("Already exists")
                } else {
                    print("No response")
                }
                completionHandler(added)
                
        }
        
        
    }
    
    
    // func checkPassword(username : String, password : String)
    // check if the current username and password match the existing
    // username and password
    
    
    // func addAccount(username : String, password : String)
    // adds the username and password to the database
    // adds default routines
    
    
    
}