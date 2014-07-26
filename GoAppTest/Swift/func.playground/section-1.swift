// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//函数和闭包
//使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值。
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
//调用函数
greet("Bob", "Tuesday")

//练习：删除day参数，添加一个参数来表示今天吃了什么午饭。
func eating(name:String, eat:String) -> String{
    return "Hello \(name),are you eat \(eat),at today!"
}

//调用
eating("Tom","土豆丝")

//使用一个元组来返回多个值。
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

//函数的参数数量是可变的，用一个数组来获取它们：
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

//练习：写一个计算参数平均值的函数。
func pingjunzhi(numbers: Int...) -> Int{
    var sum = 0
    var i:Int = 0
    for number in numbers{
        sum += number
        i++
    }
    return sum/i
}

pingjunzhi(1,1,1,20)

//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


//函数是一等公民，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)


//函数实际上是一种特殊的闭包，你可以使用{}来创建一个匿名闭包。使用in来分割参数并返回类型。
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

//练习：重写闭包，对所有奇数返回0。

//有很多种创建闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。

//你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。
sort([1, 5, 3, 12, 2]) { $0 > $1 }







