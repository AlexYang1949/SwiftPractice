//: Playground - noun: a place where people can play

import UIKit

// ***************可选链调用****************

class Person{
    var residence:Residence?
}

// 可选链式调用提供了另一种访问 numberOfRooms 的方式，使用问号( ? )来替代原来的叹号( ! )

//var r = Residence()
//var p = Person()
//p.residence = r
//p.residence?.numberOfRoom
//if let a = p.residence?.numberOfRoom{
//    print("\(a)")
//}

//----为可选链式调用定义模型类
class Residence{
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count
    }
    // 直接使用下标访问
    subscript(index:Int) -> Room{
        get {
            return rooms[index]
        }
        set {
            rooms[index] = newValue
        }
    }
    func printNumOfRooms(){
        print("number of room is\(numberOfRooms)")
    }
    
    var address : Address?
    
}

class Room{
    var name : String
    init(name : String) {
        self.name = name
    }
}

class Address{
    var buildingName : String?
    var buildingNum : String?
    var street : String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNum != nil&&street != nil{
            return "\(buildingNum)\(street)"
        }else{
            return nil
        }
    }
}

//......通过可选链调用访问属性

let john = Person()
let r = Residence()

if let roomCount = john.residence?.rooms{
    print("have \(roomCount.count) rooms")
}else{
    print("dont know rooms")
}
let someAddress = Address()
someAddress.buildingName = "new crown hotel"
func createAddress()->Address{
    print("Function was called")
    someAddress.buildingIdentifier()
    return someAddress
}


// 由于residence为nil，所以到这直接返回，不再执行。
john.residence?.address = createAddress()

// ......通过可选链式调用调用方法

if (john.residence?.address = someAddress) != nil{
    print("it possible to set address")
}else{
    print("it not possible to set address")
}

// .....通过可选链式调用访问下标，问号放在下标方括号的前面而不是后面。
if let firstRoomName = john.residence?[0].name{
    print("first room is \(firstRoomName)")
}else{
    print("unable to get first room")
}

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name:"living room"))
johnsHouse.rooms.append(Room(name:"kichen"))
john.residence = johnsHouse
john.residence?.address = someAddress

if let firstRoomName = john.residence?[0].name{
    print("first room name is \(firstRoomName)")
}else{
    print("cant know room")
}

// 可选链式调用Dictionary
var testScores = ["Dave":[45,25,34],"Jack":[90,81,34]]
testScores["Alex"]?[0] = 100

// ......连接多层可选链式调用
someAddress.street = "street nanjing"
if let jsonsStreet = john.residence?.address?.street{
    print("street is \(jsonsStreet)")
}else{
    print("street is nil")
}

//.......在方法的可选返回值上进行可选链式
if let buildingId = john.residence?.address?.buildingIdentifier(){
    print("buildId = \(buildingId)")
}

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
