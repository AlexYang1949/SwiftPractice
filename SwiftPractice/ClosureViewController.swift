//
//  ClosureViewController.swift
//  SwiftPractice
//
//  Created by shunweiwuxian on 16/9/26.
//  Copyright © 2016年 shunweiwuxian. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let funcX = getMathFunc(type: "squence")
        print(funcX(123))
        let funcY = getMathFuncWithClosure(type: "squence")
        print(funcY(123))
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMathFunc(type :String ) -> (Int) -> Int {
        func squence(val1:Int)->Int{
            return val1 * val1
        }
        
        func cube(val1:Int)->Int{
            return val1*val1*val1
        }
        
        switch type {
        case "squence":
            return squence
        default:
            return cube
        }
    }
    
    func getMathFuncWithClosure(type:String) -> (Int)->Int {
        switch type {
        case "squence":
            return {(val1:Int)-> Int in
                return val1*val1
            }
        default:
            return {(val1:Int)-> Int in
                val1*val1*val1
            }
        }
    }
    
    


}
