//: Playground - noun: a place where people can play

import UIKit

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(required: Double)
    case OutOfStock
}

struct Item {
    var price:Double
    var count:Int
}

var inventory = [
    "Candy Bar": Item(price: 1.25, count: 7),
    "Chips": Item(price: 1.00, count: 4),
    "Pretzels": Item(price: 0.75, count: 11)
]
var amountDeposited = 1.00

func vend(itemNamed name:String) throws  {
    guard var item = inventory[name] else   {
        throw VendingMachineError.InvalidSelection
    }
    
    guard item.count > 0 else   {
        throw VendingMachineError.OutOfStock
    }
    
    if amountDeposited >= item.price    {
        amountDeposited -= item.price
        --item.count
        inventory[name] = item
    }   else    {
        let amountRequired = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(required: amountRequired)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person:String) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vend(itemNamed: snackName)
}

//MARK: - Type Casting
class MediaItem {
    var name:String
    init(name:String)   {
        self.name = name
    }
}

class Movie:MediaItem {
    var director:String
    init(name:String, director:String)  {
        self.director = director
        super.init(name: name)
    }
}

class Song:MediaItem {
    var artist:String
    init(name:String, artist:String)    {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie    {
        ++movieCount
    }   else if item is Song    {
        ++songCount
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")

for item in library {
    if let movie = item as? Movie   {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    }   else if let song = item as? Song    {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person:FullyNamed {
    var fullName:String
}

func swapTwoValues<T>(inout a:T, inout b:T) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, b: &anotherInt)
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func findIndex<T:Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind { return index
        }
    }
    return nil
}


protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Stack<T>: Container {
    // IntStack的原始实现
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // 遵循Container协议的实现 
    typealias ItemType = T
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1:String, s2:String) -> Bool    {
    return s1 > s2
}
var reversed = names.sort({(s1:String, s2:String) -> Bool in
    return s1 > s2
})

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (var number) -> String in
    var output = ""
    while number > 0    {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
print(strings)

func makeIncrementor(forIncrement amount:Int)->()->Int  {
    var runningTotal = 0
    func incrementor() -> Int   {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())


class MyClass   {
    var date: NSDate    {
        willSet {
            let d = date
            print("即将从 \(d) 设定成 \(newValue)")
        }
        didSet  {
            print("已经将 \(oldValue) 设定成 \(date)")
        }
    }
    
    init()  {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.dateByAddingTimeInterval(100000)
foo.date = foo.date.dateByAddingTimeInterval(10000)
