//
//  CaloryCalculateViewController.swift
//  
//
//  Created by Arlene、 on 2015-12-06.
//
//
import Foundation
import UIKit

class CaloryCalculateViewController: UIViewController {

    
    let healthManager : HealthManager = HealthManager()
    
    func authorizeHealthKit()
    {
       // print("TODO: Request HealthKit Authorization")
        healthManager.authorizeHealthKit{(authorized, error) -> Void in
            if authorized
            {
                print("HealthKit authorization received")
            }
            else
            {
                print("HealthKit authorization denied!")
                if( error != nil)
                {
                    print("\(error)")
                }
            }
        }  
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
