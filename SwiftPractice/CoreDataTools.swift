//
//  CoreDataTools.swift
//  SwiftPractice
//
//  Created by shunweiwuxian on 2016/10/25.
//  Copyright © 2016年 shunweiwuxian. All rights reserved.
//

import UIKit
import CoreData

class CoreDataTools: NSObject {
    static let EntityName = "User"
    static let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    // add
    static func insertData() {
        let entity = NSEntityDescription.insertNewObject(forEntityName: EntityName, into: context) as! User
        
        entity.userName = "刘二"
        entity.idCard = "123123123"
        entity.lxToken = "dsfsadfaf"
        entity.mobile = "110023123123"
        do {
            try context.save()
            print("添加成功")
        } catch {
            print("添加失败")
        }
    }
    
    // delete
    static func deleteCoreData(identity:NSString) {
        let request :NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
        
        let condition = "userName = '刘一'"
        let predicate = NSPredicate(format: condition, "")
        request.predicate = predicate
        do {
            let resultList = try context.fetch(request) as! [User] as NSArray
            if resultList.count != 0 {
                for object in resultList{
                    context.delete(object as! NSManagedObject)
                    try context.save()
                    print("删除成功")
                }
            }else{
                print("删除失败！没有符合条件的")
            }
        } catch {
            print("delete fail!")
        }
    }
    
    // update
    // 根据某字段修改
    static func updateData(condition:String,change:String) {
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
        let entity : NSEntityDescription = NSEntityDescription.entity(forEntityName: EntityName, in: context)!
        let predicate = NSPredicate(format: condition, "")
        request.entity = entity
        request.predicate = predicate
        do {
            let userList = try context.fetch(request) as! [User]
            if userList.count != 0 {
                for item in userList{
                    let user = item
                    user.lxToken = change
                }
                try context.save()
            }else{
                print("没有符合条件的数据")
            }
            
        } catch {
            print("修改失败")
        }
    }
    
     // fetch
    static func fetchData() {
        var dataArr = NSArray()
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        let entity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        request.entity = entity
        do{
            dataArr = try context.fetch(request) as! [User] as NSArray
            for item in dataArr{
                let user = item as! User
                print(["userName":user.userName,"idCard":user.idCard,"token":user.lxToken,"mobile":user.mobile])
            }
        }catch{
            print("get_coredata_fail!")
        }
    }
}
