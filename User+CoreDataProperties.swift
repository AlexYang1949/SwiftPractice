//
//  User+CoreDataProperties.swift
//  SwiftPractice
//
//  Created by shunweiwuxian on 2016/10/25.
//  Copyright © 2016年 shunweiwuxian. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var userName: String?
    @NSManaged public var idCard: String?
    @NSManaged public var mobile: String?
    @NSManaged public var lxToken: String?

}
