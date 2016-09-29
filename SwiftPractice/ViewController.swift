//
//  ViewController.swift
//  SwiftPractice
//
//  Created by shunweiwuxian on 16/9/25.
//  Copyright © 2016年 shunweiwuxian. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var drink :Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
/// 枚举 ： 1、支持计算属性  2、实例方法和类型方法  3、构造器完成初试化 4、不支持继承
//  rawValue
enum Drink {
    case water
    case juice
}

