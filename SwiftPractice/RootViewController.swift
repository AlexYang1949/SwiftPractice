//
//  RootViewController.swift
//  SwiftPractice
//
//  Created by shunweiwuxian on 2016/10/25.
//  Copyright © 2016年 shunweiwuxian. All rights reserved.
//

import UIKit
import CoreData

class RootViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
//        CoreDataTools.insertData()
        CoreDataTools.updateData(condition:"userName = '刘一'",change:"哈哈哈哈哈哈哈")
        CoreDataTools.fetchData()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
