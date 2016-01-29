//: Playground - noun: a place where people can play

import UIKit


struct Matrix {
    let rows:Int, columns:Int
    var grid:[Double]
    init(rows:Int ,columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsVaildForRow(row:Int, column:Int)->Bool  {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row:Int ,column:Int) -> Double    {
        get {
            assert(indexIsVaildForRow(row, column: column), "index out of range")
            return grid[(row * column) + column]
        }
        set {
            assert(indexIsVaildForRow(row, column: column), "index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 3, columns: 3)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
let someValue = matrix[1, 0]


class Vehicle {
    var currentSpeed = 0.0
    var description:String  {
        return "raveling at \(currentSpeed) miles per hour"
    }
    func makeNoise()    {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle :\(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


class Train: Vehicle {
    override func makeNoise() {
        print("choo choo!")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var geer = 1
    override var description:String {
        return super.description + " in geer \(geer)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.geer = 3
print("car : \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed:Double {
        didSet  {
            geer = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Automatic:\(automatic.description)")


//构造过程(Initialization)

let string = "hello world"
if string.containsString("hello")   {
    print("yes")
}   else    {
    print("no")
}

struct Fahrenheit   {
    var temperature = 32.0
    init()  {
    }
}

var f = Fahrenheit()
print("temperature is \(f.temperature)")

struct Celsius  {
    var temperatureInCelsius:Double = 0.0
    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin:Double)  {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius:Double)  {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print("\(boilingPointOfWater.temperatureInCelsius)")
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print("\(freezingPointOfWater.temperatureInCelsius)")
let bodyTemperature = Celsius(37.0)
print("\(bodyTemperature.temperatureInCelsius)")

struct Color    {
    let red, green, blue:Double
    init(red:Double, green:Double, blue:Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double)  {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

class SurveyQuestion    {
    var text:String
    var response:String?
    init(text:String)   {
        self.text = text
    }
    
    func ask()  {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do"

class ShoppingListItem  {
    var name:String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

struct Size {
    var width = 0.0, height = 0.0
}
let size = Size(width: 2.0, height: 2.0)
print("width:\(size.width) ,height:\(size.height)")

class Food  {
    var name:String
    init(name:String)   {
        self.name = name
    }
    convenience init()  {
        self.init(name:"[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")

class RecipeIngredient:Food {
    var quantity:Int
    init(name:String, quantity:Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name:String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItemNew:RecipeIngredient  {
    var purchased = false
    var description:String  {
        var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? "?": "?"
        return output
    }
}

var breakfastList = [
    ShoppingListItemNew(),
    ShoppingListItemNew(name: "Becon"),
    ShoppingListItemNew(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "orange juice"
breakfastList[0].purchased = true
for item in breakfastList   {
    print(item.description)
}

struct Animal {
    let species:String
    init?(species:String)   {
        if species.isEmpty  { return nil}
        self.species = species
    }
}

let someAnimal = Animal(species: "")
if let giraffe = someAnimal {
    print("An animal was initialized with a species of \(giraffe.species)")
}

class Product   {
    let name:String!
    init?(name:String)  {
        self.name = name
        if name.isEmpty { return nil }
    }
}

if let bowTie = Product(name: "bow til")    {
    //不需要检查name == nil
    print("product name is \(bowTie.name)")
}

class CartItem:Product  {
    var quantity:Int!
    init?(name:String, quantity:Int)    {
        super.init(name: name)
        if quantity < 1 { return nil }
        self.quantity = quantity
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2)   {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

class Document  {
    var name:String?
    init()  {}
    init?(name:String)  {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument:Document   {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name:String)  {
        super.init()
        if name.isEmpty {
            self.name = "Untitled"
        }   else    {
            self.name = name
        }
    }
}

class Checkerboard  {
    let boardColors:[Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool  {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend:Int) -> Int   {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins:Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse:Int
    init(coins:Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins:Int)    {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit  {
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

var playerTwo:Player? = Player(coins: 100)
print("A new player has joined the game with \(playerTwo!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne?.winCoins(2_000)
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne = nil
print("There are now \(Bank.coinsInBank) coins left in the bank")

//ARC
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person?
    deinit { print("Apartment #\(number) is being deinitialized") }
}

var john: Person?
var number73: Apartment?
john = Person(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john

john = nil
number73 = nil

class HTMLElement   {
    let name:String
    let text:String?
    
    lazy var asHTML:Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }   else    {
            return "<\(self.name)/"
        }
    }
    
    init(name:String, text:String? = nil)   {
        self.name = name
        self.text = text
    }
    
    deinit  {
        print("\(name) is being deinited")
    }
}



