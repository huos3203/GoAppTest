// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//对象和类
//使用class和类名来创建一个类。类中属性的声明和常量、变量声明一样，唯一的区别就是它们的上下文是类。同样，方法和函数声明也一样。
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
//    练习：使用let添加一个常量属性，再添加一个,接收一个参数的方法。
    let str="常量"
    func test(name:String) -> String{
        return name
    }
}

//要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法。
//实例化
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
shape.str
var str1 = shape.test("常量12")




//这个版本的Shape类缺少了一些重要的东西：一个构造函数来初始化类实例。使用init来创建一个构造器。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//注意：self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）。

//如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。



//子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以忽略父类。

//子类如果要重写父类的方法的话，需要用override标记——如果没有添加override就重写父类方法的话编译器会报错。编译器同样会检测override标记的方法是否确实在父类中。
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    //重写父类方法
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
//实例化
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//练习：创建NamedShape的另一个子类Circle，构造器接收两个参数，一个是半径一个是名称，实现area和describe方法
class Circle: NamedShape{
    var r: Double
    init(r1:Double,name:String){
        self.r = r1
        super.init(name: name)
        numberOfSides = 0
    }
    
    //计算面积
    func area() -> Double{
        return r * 3.14
    }

    override func simpleDescription() -> String{
        return "A Circle with r length is \(r)."
    }
}

//实例化
var circle = Circle(r1:12 ,name:"圆")
circle.area()
circle.simpleDescription()



//属性可以有 getter 和 setter 。
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
//实例化
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

//在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显示的设置一个名字。
//注意EquilateralTriangle类的构造器执行了三步：
//1. 设置子类声明的属性值
//2. 调用父类的构造器
//3. 改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
//



//如果你不需要计算属性但是需要在设置一个新值之前运行一些代码，使用willSet和didSet。
//比如，下面的类确保三角形的边长总是和正方形的边长相同。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

//类中的方法和一般的函数有一个重要的区别，函数的参数名只在函数内部使用，但是方法的参数名需要在调用的时候显式说明（除了第一个参数）。默认情况下，方法的参数名和它在方法内部的名字一样，不过你也可以定义第二个名字，这个名字被用在方法内部。

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

//处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加?。如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil。否则，?之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength














