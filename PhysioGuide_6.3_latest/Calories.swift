//
//  Calories.swift
//  PhysioGuide_7
//
//  Created by Rohm on 12/6/15.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Calories {
    
/*func addUser(username : String, password: String, completionHandler: (Int) -> Void)
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

}*/

 

    func getCalories(username : String, completionHandler: (JSON) -> Void)
    {
        let identity: [String:String] = ["username" : username]

        Alamofire.request(.POST, "http://52.27.94.207/getCalorie.php", parameters : identity, encoding: ParameterEncoding.URL)
            .validate()
            .responseJSON {
                (responseData) in
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                //print(swiftyJsonVar)
                
                completionHandler(swiftyJsonVar)
        }
        
        
    }



}