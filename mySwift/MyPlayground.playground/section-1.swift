// Playground - noun: a place where people can play

import UIKit

class NamedShape {
    var numberofSides :Int = 0
    var name:String
    
    init(name: String)  {
        self.name = name;
    }
    
    func simpleDescription() -> String  {
        return "A shape with \(numberofSides) sides"
    }
}

let namedShape = NamedShape(name: "namedShape")
namedShape.simpleDescription()

class Square : NamedShape {
    var sideLength :Double
    init(sideLength :Double ,name :String)  {
        self.sideLength = sideLength
        super.init(name: name)
        numberofSides = 4
    }
    
    func area() -> Double   {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 2.5, name: "a test square")
test.area()
test.sideLength = 4
test.simpleDescription()


class EquilateralTriangle: NamedShape {
    var sideLength:Double = 0.0
    
    init(sideLength :Double ,name :String)  {
        self.sideLength = sideLength
        super.init(name: name)
        numberofSides = 3
    }
    
    var perimeter :Double   {
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

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 6.3
triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTriangle   {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square :Square  {
        willSet {
            triangle.sideLength = newValue.sideLength;
        }
    }
    
    init(size :Double ,name :String)    {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength


/**
*  collection
*/
var shoppingList:[String] = ["Eggs","Milk"]
print("contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("the list is empty")
}   else    {
    print("the list is not empty")
}

shoppingList.append("apple")
shoppingList += ["meat","water"]

var firstObj = shoppingList[0]
shoppingList[0] = "six eggs"
shoppingList.insert("Bananas", atIndex: 2)
let removeObj = shoppingList.removeAtIndex(0)
let rmLast = shoppingList.removeLast()
for item in shoppingList    {
    print(item)
}

//for (index,value) in enumerate(shoppingList)    {
//    print("item \(index + 1) : \(value)")
//}

var someInt = [Int]()
print("someInt count is \(someInt.count)")
someInt.append(1)
someInt.append(2)
someInt = []

var threeDoubles = [Double] (count: 3, repeatedValue: 1.2)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.2)
var sixDoubles = threeDoubles + anotherThreeDoubles

var airport = ["TYO":"Tokyo","DUB":"Dublin"]
print("the dictionary of airport contains \(airport.count) items")
airport["LHR"] = "London"
airport["LHR"] = "London Heathrow"

if let oldValue = airport.updateValue("Dublin Internation", forKey: "DUB")  {
    print("the old value for DUB was \(oldValue)")
}

if let airportName = airport["DUB"] {
    print("the airport name is \(airportName)")
}   else    {
    print("that airport is not in the dictionary")
}

airport["APL"] = "Apple internation"
airport["APL"] = nil

for (key,value) in airport  {
    print("the key is \(key) and the value is \(value)")
}
let keys = Array(airport.keys)
let values = Array(airport.values)

var namesOfIntegers = Dictionary<Int,String>()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]


for index in 1...5  {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("answer is \(answer)")


/**
*  蛇与梯子
*/
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
gameLoop: while square < finalSquare  {
    if ++diceRoll == 7  {
        diceRoll == 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("game over!")

//func printAndCount(stringToPrint:String) -> Int {
//    print(stringToPrint)
//    return countElements(stringToPrint)
//}
//
//printAndCount("this is a string")

func count(string :String) ->(n:Int ,m:Int ,i:Int ,j:Int)   {
    var n = 0, m = 0 ,i = 0 ,j = 0
    if string.hasPrefix("str")  {
        return (1,2,3,4)
    }   else    {
        return (n,m,i,j)
    }
}

let countResult = count("string")
print("n is \(countResult.n) ,m is \(countResult.m)")

func someFunction(externalParameterName localParameterName :Int)    {
    //some action
}

someFunction(externalParameterName: 123)

//func countNew(#string :String)  {
//    //some action
//}
//
//countNew(string: "这里用了#号来标识")
//
//func join(#string:String ,#toString:String, withJoiner joiner:String = " ") -> String   {
//    return string + joiner + toString
//}
//
//join(string: "Hello", toString: "world")
//
//func join1(s1: String, s2: String, joiner: String = " ") -> String {
//    return s1 + joiner + s2
//}
//
//join1("Hello", "world", joiner: "-")


func arithmeticMean(numbers:Double...) ->Double {
    var total:Double = 0
    for number in numbers   {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(12.3,123,11)

enum Rank:Int   {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack: return "jack"
        case .Queen: return "queen"
        case .King: return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

enum Suit   {
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
            return "spades color"
        case .Hearts:
            return "hearts color"
        case .Diamonds:
            return "diamonds color"
        case .Clubs:
            return "clubs color"
        }
    }
}

let suit = Suit.Spades
let suitDescription = suit.simpleDescription()
let suitColor = suit.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String,String)
    case Error(String)
}

var success = ServerResponse.Result("6:00 am", "8:00 pm")
var failure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

var value:String?
value = "123"
let hash = value?.hasPrefix("1")
//let valueHash = value.hashValue


protocol ExampleProtorol    {
    var simpleDescription:String    { get }
    mutating func adjust() //mutating 关键字用来标记一个会修改结构体的方法
}

class SimpleClass:ExampleProtorol {
    var simpleDescription:String = "a very simple class "
    var anotherProperty:Int = 123456
    
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct simpleStructure:ExampleProtorol {
    var simpleDescription:String = "a very simple struct "
    
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

var b = simpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int:ExampleProtorol   {
    var simpleDescription:String    {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)

extension Double    {
    var simpleDescription:String    {
        return "the new double is \(self + 1)"
    }
}

print(2.0.simpleDescription)

//泛型
func repeatItem<Item>(item:Item, numberOfTimes:Int) ->[Item]    {
    var result = [Item]()
    for _ in 0..<numberOfTimes  {
        result.append(item)
    }
    return result
}

repeatItem("knock", numberOfTimes: 4)

enum OptionalValue<T>   {
    case None
    case Some(T)
    
    func simpleDescription() -> String  {
        return "\(self)"
    }
}

var possibleInteger:OptionalValue<Int> = .None
possibleInteger = .Some(100)
print(possibleInteger.simpleDescription())

let http404Error = (404,"Not found")
let (statusCode,statusMessage) = http404Error
print("the status code is \(statusCode) and the message is \(statusMessage)")
print("the status code is \(http404Error.0) and the message is \(http404Error.1)")

let (justStatusCode,_) = http404Error
print("the just status code is \(justStatusCode)")

let http200Status = (statusCode:200,description:"OK")
print("the status code is \(http200Status.statusCode) and ths message is \(http200Status.description)")

var serverResponseCode:Int? = 404
serverResponseCode = nil

var surveyAnswer:String?  //设置为可选值后不赋值则自动赋值为nil


let possibleString:String? = "a optional string"
let forceString:String = possibleString!

let assumedString:String! = "an implicity unwrapped string"
let implicityString:String = assumedString

func canThrowAnError() throws    {
    //可抛出错误
}

let age = -3
assert(age < 0,"A person's age cannot be less than zero") //当age>0时，断言中的条件为false
//assert(age < 0)

let defaultColorName = "red"
var userDefinedColorName:String?

var colorNameToUse = userDefinedColorName ?? defaultColorName


var emptyString:String = ""
var emptyStringNew = String()

if emptyString.isEmpty  {
    print("nothing here")
}

var simpleDict = ["0":"zero","1":"one","2":"two","3":"three"]
for key in simpleDict.keys.sort()  {
    print(key)
}
print(simpleDict.values.sort())


let yetAnotherPoint = (1, -1)


func yourName(firstName:String,lastName:String) ->(first:String,last:String)    {
    return (firstName,lastName)
}

let name = yourName("jobs", lastName: "steve")
print("your name is \(name.first) \(name.last)")


func someFunction(firstParameterName: Int, secondParameterName: Int, _ thirdParameterName: Int = 123) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}

func simpleFunc(var string:String) ->String {
    string = string + "hi"
    return string
}

simpleFunc("hi ")

var intA = 12
var intB = 20
func swapTwoInts(inout a:Int,inout _ b:Int)   {
    let tempA = a
    a = b
    b = tempA
}

swapTwoInts(&intA, &intB)
print("a = \(intA) b = \(intB)")

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

var someFunction: (Int, Int) -> Int = addTwoInts

addTwoInts(1,2)

enum Barcode    {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(1, 2, 3, 4)
productBarcode = .QRCode("1234")

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//使用枚举成员的 rawValue 属性可以访问该枚举成员的原始值
let planet = Planet.Venus.rawValue

let possiblePlanet = Planet(rawValue: 7)

//在枚举类型开头加上 indirect 关键字来表示它的所有成员都是可递归的
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right) }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))


//class and struct
struct Resolution   {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlanced = false
    var frameRate = 0.0
    var name:String?
}

var someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280

let vga = Resolution(width: 640, height: 480)
someResolution = Resolution()
someResolution.width

struct FixedLengthRange {
    var firstValue:Int
    let lenght:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 1, lenght: 3)
rangeOfThreeItems.firstValue = 5
//rangeOfThreeItems.lenght = 2  wrong,length is a let value


struct Point {
    var x = 0.0 , y = 0.0
}

struct Size {
    var width = 0.0 , height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point    {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter)  {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var squareNew = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = squareNew.center
squareNew.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(squareNew.origin.x), \(squareNew.origin.y))")


struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center:Point    {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

class StepCounter {
    var totalSteps:Int = 0  {
        willSet(newTotalSteps)  {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet  {
            if totalSteps > oldValue    {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 888

struct someStructure {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty:Int {
        return 1
    }
}

enum someEnumeration    {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty:Int {
        return 6
    }
}

class someClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty:Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}











