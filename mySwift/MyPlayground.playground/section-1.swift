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
println("contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    println("the list is empty")
}   else    {
    println("the list is not empty")
}

shoppingList.append("apple")
shoppingList += ["meat","water"]

var firstObj = shoppingList[0]
shoppingList[0] = "six eggs"
shoppingList.insert("Bananas", atIndex: 2)
let removeObj = shoppingList.removeAtIndex(0)
let rmLast = shoppingList.removeLast()
for item in shoppingList    {
    println(item)
}

for (index,value) in enumerate(shoppingList)    {
    println("item \(index + 1) : \(value)")
}

var someInt = [Int]()
println("someInt count is \(someInt.count)")
someInt.append(1)
someInt.append(2)
someInt = []

var threeDoubles = [Double] (count: 3, repeatedValue: 1.2)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.2)
var sixDoubles = threeDoubles + anotherThreeDoubles

var airport = ["TYO":"Tokyo","DUB":"Dublin"]
println("the dictionary of airport contains \(airport.count) items")
airport["LHR"] = "London"
airport["LHR"] = "London Heathrow"

if let oldValue = airport.updateValue("Dublin Internation", forKey: "DUB")  {
    println("the old value for DUB was \(oldValue)")
}

if let airportName = airport["DUB"] {
    println("the airport name is \(airportName)")
}   else    {
    println("that airport is not in the dictionary")
}

airport["APL"] = "Apple internation"
airport["APL"] = nil

for (key,value) in airport  {
    println("the key is \(key) and the value is \(value)")
}
let keys = Array(airport.keys)
let values = Array(airport.values)

var namesOfIntegers = Dictionary<Int,String>()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]


for index in 1...5  {
    println("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
println("answer is \(answer)")


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
println("game over!")

func printAndCount(stringToPrint:String) -> Int {
    print(stringToPrint)
    return countElements(stringToPrint)
}

printAndCount("this is a string")

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

func countNew(#string :String)  {
    //some action
}

countNew(string: "这里用了#号来标识")

func join(#string:String ,#toString:String, withJoiner joiner:String = " ") -> String   {
    return string + joiner + toString
}

join(string: "Hello", toString: "world")

func join1(s1: String, s2: String, joiner: String = " ") -> String {    return s1 + joiner + s2
}

join1("Hello", "world", joiner: "-")


func arithmeticMean(numbers:Double...) ->Double {
    var total:Double = 0
    for number in numbers   {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(12.3,123,11)


