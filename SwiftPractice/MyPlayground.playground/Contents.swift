//: Playground - noun: a place where people can play

import UIKit


//------------------------------------//

//1.1 .......简单值
var myV = 12
myV = 14
let myConstant  = 16

// 显式转换
let label = "this width = "
let width = 10
let widthLabel = label + String(width)

// 转换字符串
let apples = 3
let oranges = 5
let sum = "I have \(apples + oranges) fruites"

// 字典和数组 使用[]
var shoppingList = ["fish","water","rice"]
var students = ["tom":12,"alex":13]
shoppingList[1]
students["tom"]

shoppingList = []
students = [:]

let emptyArray = [String]()
let emptyDictionary = [String:Int]()

//1.2 .....控制流
// for in
let individualScores = [12,43,123,42]
var teamScore = 0
for score in individualScores{
    if score > 40{
        teamScore += 1
    }
}
print("\(teamScore)")

// if let

var optionalString :String? = "Hello world"
print(optionalString == nil)

var optionalName :String? //= "Alex Yang"
var greeting = "Hello "
if let name = optionalName{
    greeting = "Hello \(name)"
}else{
    greeting = "Hello nil"
}

// ?? 表示前面的变量缺省就使用后面的变量
let nickName : String? = "Bob"
let fullName : String = "Alex"
let infoGreet = "Hi,\(nickName ?? fullName)"

// switch 支持任意类型数据以及各种比较操作
let vegetable = "red pepper"
switch vegetable{
case "cucumber","watercress":
    print("That make a good sandwich.")
case let x where x.hasSuffix("pepper"):
    print("a spicy\(x)")
default:
    print("default")
}

// for in 遍历字典
let interestIntNumber = [
    "Prime" : [2,3,5,7,13],
    "Fibonacci" : [1,1,2,3,5,8],
    "Square" : [1,4,9,16,25]
]

for (keys,values) in interestIntNumber{
    for value in values{
        print("\(value)")
    }
    print(keys)
}

// 使用 ..<表示范围，不包含最后一个  ...表示包含
for i in 0..<4{
    print(i)
}

//1.3 ......函数和闭包
// ->表示返回值
func greet(name : String,day : String)->String{
    return name + day
}

var greet123 = greet(name: "Bob ", day: "Friday")

// 使用元组作为返回值
func calculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores{
        if score < min{
            min = score
        }else if score > max{
            max = score
        }
        sum += score
    }
    return(min,max,sum)
}

let result = calculateStatistics(scores: [12,32,123,41])
result.min
result.max
result.sum

// 可变数量的参数
func sumOf(nums: Int...)->Int{
    var sum = 0
    for num in nums{
        sum += num
    }
    return sum
}
sumOf(nums: 1,2,3,1,4,1)


// 函数是一等类型，可以作为另一个函数的返回值
func incrementer() ->((Int) -> Int){
    func addOne(number:Int)->Int{
        return number + 1
    }
    return addOne
}

let add = incrementer()
add(12)

// 函数作为参数传递
func hasAnyMatches(list:[Int],condition:(Int) -> Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number :Int)->Bool{
    return number < 10
}

hasAnyMatches(list: [23,412,412,123,3,12], condition: lessThanTen)

// 函数是特殊的闭包，可以使用匿名闭包，使用in将参数和函数体分离
let numbers = [12,32,31,43]
numbers.map({
    (number :Int)->Int in
    return number * 3
})

// 通过参数位置引用参数
numbers.sorted {
    $0>$1
}


var closure1 = {(val : Int) -> Int in val*val}
closure1(11)

// 省略return
var closure2 : (Int)->Int = {val in val*val}
closure2(9)

// 省略型参名
var closure3:(Int)->Int = {$0 * $0}
closure2(10)

// 尾随闭包
func closure4( _: inout [Int] , fn : @escaping (Int)->Int)->Int{
    var result =  0
    //    print(data.map{fn($0)})
    //    print(data)
    return result
}
var arr = [1,2,3,4,5]

closure4(&arr) { $0+1 }

// 闭包作为参数传递
func funcIsBool(boolBlock : (Int)->Bool)  {
    let x = 100
    if boolBlock(x) {
        print("YES")
    }
}

funcIsBool { (val) -> Bool in
    val > 50
}

//funcIsBool({1<2})
var arr2 = arr.map({$0 + 1})
    .filter({$0 < 4})
print(arr2)

var arr3 = arr.flatMap({($0+1)<4})
print(arr3)



//1.4 ......对象和类
// 使用class和类名创建一个类
class Shape{
    var numberOfSides = 0
    let color = "yellow"
    func simpleDesc() -> String {
        return "A shape has \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 9
shape.simpleDesc()

// 添加构造函数和析构函数
class NamedShape{
    var numberOfSides : Int = 0
    var name : String
    
    init(name:String) {
        self.name = name
    }
    func simpleDesc() -> String {
        return "A \(name)Shape has \(numberOfSides) sides"
    }
    deinit {
        print("deinit")
    }
}

var nameShape = NamedShape(name:"trigle")
nameShape.numberOfSides = 3
nameShape.simpleDesc()

// 子类的定义方法是在她们的类名后面加上父类的名字
class Square : NamedShape{
    var sideLength :Double
    init(sideLength:Double , name : String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    override func simpleDesc() -> String {
        return "A square's sideLength is \(numberOfSides)"
    }
}

// 计算属性
class EquilateralTriangle : NamedShape{
    var sideLength :Double
    init(sideLength:Double , name : String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return sideLength * 3
        }
        set {
            sideLength = newValue/3
        }
    }
}

var eqt = EquilateralTriangle(sideLength:12.5,name:"tr")
eqt.perimeter = 25
eqt.perimeter
eqt.sideLength

// 子类构造器的三个步骤
// 1、设置子类声明的属性值 2、调用父类构造器 3、改变父类定义的属性

// 需要在设置新值之前或者之后调用代码，使用willSet和didSet

class TriangleAndSquare{
    var square:Square{
        willSet{
            eqt.sideLength = square.sideLength
        }
    }
    var eqt:EquilateralTriangle{
        willSet{
            square.sideLength = eqt.sideLength
        }
    }
    init(sideLength:Double) {
        square = Square(sideLength:sideLength,name:"ss")
        eqt = EquilateralTriangle(sideLength:sideLength,name:"tr")
    }
}

// 处理变量的可选值
let optionalSquare:Square? = Square(sideLength: 3.2, name: "option square")

let sideLength = optionalSquare?.sideLength



















