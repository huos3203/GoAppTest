// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
for x in 1..10 {
    x
}

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let leng = 5.0
let hello = "hello baby \(leng)"

//使用if和switch来进行条件操作，使用for-in、for、while和do-while来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

//使用if和let来处理值缺失的情况。有些变量的值是可选的。一个可选的值可能是一个具体的值或者是nil，表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的
var optionalString: String? = "Hello"
optionalString == nil
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    greeting = "optionalName is nil"
}


//switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等
//运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break
let vegetable = "red pepper"
switch (vegetable) {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
    

  default:
    let vegetableComment = "Everything tastes good in soup."
}

//使用for-in来遍历字典，需要两个变量来表示每个键值对:
//添加另一个变量来记录哪种类型的数字是最大的
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestkind:NSString?=nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestkind = "largestKind = \(kind)"
        }
    }
}
largest
largestkind

//使用while来重复运行一段代码直到不满足条件。循环条件可以在开头也可以在结尾:
var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m

//在循环中使用..来表示范围，也可以使用传统的写法，两者是等价的：
//使用..创建的范围不包含上界，如果想包含的话需要使用...
var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop



















