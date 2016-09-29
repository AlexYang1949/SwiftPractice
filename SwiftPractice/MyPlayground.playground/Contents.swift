//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var closure1 = {(val : Int) -> Int in val*val}
closure1(11)

// 省略return
var closure2 : (Int)->Int = {val in val*val}
closure2(9)

// 省略型参名
var closure3:(Int)->Int = {$0 * $0}
closure2(10)

// 尾随闭包
func closure4(data:[Int] , fn : (Int)->Int)->Int{
    var result =  0
    print(data.map{$0+10})
    print(data)
    return result
}

closure4([1,2,3,4]){$0+10}

// 闭包作为参数传递
func funcIsBool(boolBlock : (val : Int)->Bool)  {
    let x = 100
    if boolBlock(val : x) {
        print("YES")
    }
}

funcIsBool { (val) -> Bool in
    val > 50
}

//funcIsBool({1<2})







