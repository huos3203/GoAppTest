// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//枚举和结构体
//使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

//练习：写一个函数，通过比较它们的原始值来比较两个Rank值。

//在上面的例子中，枚举原始值的类型是Int，所以你只需要设置第一个原始值。剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。

//使用toRaw和fromRaw函数来在原始值和枚举值之间进行转换。
if let convertedRank = Rank.fromRaw(3) {
    let threeDescription = convertedRank.simpleDescription()
}

//枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，如果原始值没有意义，你不需要设置。
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades:
            return "black"
        case .Hearts:
            return "red"
        case .Diamonds:
            return "red"
        case .Clubs:
            return "black"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

//练习：给Suit添加一个color方法，对spades和clubs返回“black”，对hearts和diamonds返回“red”。

let color1 = Suit.Spades
color1.color()

//注意：有两种方式可以引用Hearts成员：给hearts常量赋值时，枚举成员Suit.Hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.Hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。


//使用struct来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们结构体之间最大的一个区别就是 结构体是传值，类是传引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//练习：给Card添加一个方法，创建一副完整的扑克牌并把每张牌的rank和suit对应起来。

//一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值和原始值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。

//例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}

//练习：给ServerResponse和switch添加第三种情况。
//
//注意：如何从ServerResponse中提取日升和日落时间。
