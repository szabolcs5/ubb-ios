//: Playground - noun: a place where people can play

//iOS Programozás, választható tantárgy 2022
//1. Labor Playground és bevezetés a Swift nyelvbe

import Foundation

// VARIABLES

// 1. (0.5 p) Declare a constant array favouriteNumbers with values for your favourite numbers.

let favouriteNumbers: [Int] = [12, 1, 99]


// 2. (0.5 p) Declare a dictionary with the name of your colleagues and the "department" he/she is working on.

var colleagues: [String: String] = ["Boti": "Webgurus", "Lilla": "Codespring"]


// 3. (0.5 p) Declare an array of tuples with the list of your colleagues and their height.
// ex. tuple: ("Big Guy", 201)

var colleaguesHeight: [(String, Int)] = [("Big Guy", 201), ("Little Guy", 140), ("Awesome John", 140)]

// 4. (0.5 p) Order the array created above in ascending order (based on height)
// use `sorted`

colleaguesHeight.sorted(by: {
    $0.1 < $1.1
})

// 5. (0.5 p) Group the dictionary by department.
// use the: `Dictionary(grouping: ..., by: ...)` initializer

Dictionary(grouping: colleagues, by: { $0.1 })

// 6. (0.5 p) Order the tuple based on the heights, if there are entries with the same height, order them by alphabetical order.
// hint: the `sorted` function can take two properties as parameter

colleaguesHeight.sorted(by: {
    $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1
})

// 7. (0.5 p) Increment every number by one in favouriteNumbers.
// use `map`

favouriteNumbers.map({
    $0 + 1
})

// 8. (0.5 p) Print out only the name of your colleagues from the dictionary.

print(colleagues.keys)


// 9. (1 p) Print out the average height of your colleagues.
// use `map` + `reduce`

colleaguesHeight.map({
    $0.1
}).reduce(0.0, {
    $0 + Double($1 / colleaguesHeight.count)
})

// 10. (1 p) Split the array in half.
// hint: you can access a subarray like this: `someArray[..<n]` or `someArray[n...]`

var sub : Int = favouriteNumbers.count / 2
var leftArray = favouriteNumbers[0..<sub]
var rightArray = favouriteNumbers[sub...]

// 11. (1 p) Declare the first 10 Fibonacci numbers in a set. (1,1,2,3,...)
// Obviously the number 1 will appear only once in this set (properties of a set)
// write the algorithm, (implement a function like this: `func fibonacci(n: Int) -> Set<Int>`)

func fibonacci(n: Int) -> Set<Int> {
    var a: Int = 0
    var b: Int = 1

    var numbers: Set<Int> = Set<Int>()

    if n < 0 {
        return numbers
    }

    for i in 0..<n {
        var c: Int = a + b
        a = b
        numbers.insert(b)
        b = c
    }

    return numbers
}

print(fibonacci(n: 10))

// 12. (1 p) Get the intersect of two sets: the first 10 Fibonacci numbers and the first 10 prime numbers.
// This time you won't need to write the alorithm of the Fibonacci numbers. Just put them in a list, and use that list.
// there is a method `intersection`

func isPrime(n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    if n <= 3 {
        return true
    }

    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func primeNumbers(n: Int) -> Set<Int> {
    var primes: Set<Int> = []
    var currentNumber: Int = 0
    if n <= 0 {
        return primes
    }
    while primes.count != n {
        if isPrime(n: currentNumber) {
            primes.insert(currentNumber)
        }
        currentNumber += 1
    } 
    return primes
}

var fiboList : Set<Int> = fibonacci(n: 10)
var prime: Set<Int> = primeNumbers(n: 10)
var intersection: Set<Int> = fiboList.intersection(prime)

// CONTROL FLOW

// 13. (1 p) Take a positive number and print the reversed version of it.
// write the algorithm (implement a function like this: `func reverse(number: Int) -> Int`)

func reverse(number: Int) -> Int {
    var savedNumber: Int = number

    var reversedNumber: Int = 0

    while (savedNumber > 0) {
        reversedNumber = reversedNumber * 10 + savedNumber % 10
        savedNumber /= 10
    }

    return reversedNumber
}

// 14. (1 p) Choose a number and find out if it's palindrome.
// use the solution from above

func isPalindrome(number: Int) -> Bool {
    number == reverse(number: number)
}

print(isPalindrome(number: 33))

// CLASSES AND STRUCTS

// 15. (1 p) Write a struct named Course which will have a String property name and an Int one mark.
// ex. struct Sth { aProperty: Type, ..}

struct Course {
    var name: String
    var mark: Int
}

// 16. (1 p) Create a class named Student which will have a private String property name and a private array of courses which he attends to. Both properties will be initialized in the constructor.

class Student {
    private var name: String
    private var courses: [Course]

    init(name: String, courses: [Course]) {
        self.name = name
        self.courses = courses
    }
}

// ENUMS

// 17. (1 p) Create an enum type which will have two cases: normal and scholar.
// ex. enum Sth { case fist, case last }

enum Role {
    case normal
    case scholar
}

// 18.( 1 p) Create a String property in the enum (e.g. description) which will return a textual representation of each case (e.g. "This is a scholar student.").
// use the `switch` statement for setting the right textual representation

extension Role {
    var description: String {
        switch self {
            case .normal:
                return "This is a normal student."
            case .scholar:
                return "This is a scholar student."
        }
    }
}

// 19. (1 p) Add this enum as a property to the above mentioned Student class.

class Student {
    var name: String
    var courses: [Course]
    var role: Role
    init(name: String, courses: [Course], role: Role) {
        self.name = name
        self.courses = courses
        self.role = role
    }
}

// 20. (1 p) Modify the Student class constructor so the type type parameter has a default value of .normal).
// HINT: you can give a default value in the constructor like `init(..., type: Type = .aType)`

class Student {
    var name: String
    var courses: [Course]
    var role: Role

    init(name: String, courses: [Course], role: Role = .normal) {
        self.name = name
        self.courses = courses
        self.role = role
    }
}

// PROTOCOLS

// 21. (1 p) Vehicles can have different properties and functionality.
// All Vehicles:
// • Have a speed at which they move
// • Calculate the duration it will take them to travel a certain distance
// All Vehicles except a Motorcycle
// • Have an amount of Windows
// Only Buses:
// • Have a seating capacity
// Create the following Vehicles types: Car, Bus, Motorcycle. Do not use subclassing, use protocols instead. Create an array over the minimum required protocol and put an instance of every type in it and print the the following text for every item of the array (if it's possible): " *type* has *amount of windows* windows and needs *time* to travel 100 kilometers. "

protocol Vehicle {
    var speed: Double { get set }
    mutating func calculateDuration(distance: Double) -> Double
}

protocol WindowVehicle: Vehicle {
    var windows: Int { get set }
}

struct Bus: WindowVehicle {
    var speed: Double
    var windows: Int
    var capacity: Int
    func calculateDuration(distance: Double) -> Double {
        return distance * 60 / speed
    }
}

struct MotorCycle: Vehicle {
    var speed: Double
    func calculateDuration(distance: Double) -> Double {
        return distance * 60 / speed
    }
} 

struct Car: WindowVehicle {
    var speed: Double
    var windows: Int
    func calculateDuration(distance: Double) -> Double {
        return distance * 60 / speed
    }
}

var car: Car = Car(speed: 220, windows: 6)
var motor: MotorCycle = MotorCycle(speed: 110)
var bus: Bus = Bus(speed: 60, windows: 18, capacity: 100)
var vehicles: [Vehicle] = [car, motor, bus]

for i in 0..<vehicles.count {
    if var elem = vehicles[i] as? WindowVehicle {
        print("\(type(of: vehicles[i])) has \(elem.windows) windows and needs \(elem.calculateDuration(distance: 100)) to travel 100 kilometers.")    
    } else {
        print("\(type(of: vehicles[i])) needs \(vehicles[i].calculateDuration(distance: 100)) to travel 100 kilometers.")
    }
}



// EXTENSTIONS

// 22. (1 p) Create Int extensions for:
// • Radian value of a degree (computed property)
// • Array of digits of Int (computed property)
extension Int {
    
    func toRadian () -> Double {
        return Double.pi * Double(self) / 180
    }
    
    func toDigits() -> [Int] {
        var array: [Int] = []

        var savedNumber = self
        while (savedNumber > 0) {
            array.append(savedNumber % 10)
            savedNumber /= 10
        }
        array.reverse()
        return array
    }
}

// 23. (1 p) Create String extensions for:
// • Check if the string contains the character 'a' or 'A'

extension String {
    func containsA() -> Bool {
        return self.contains("a") || self.contains("A")
    }
}


// 24. (1 p) Create Date extensions for:
// • Check if a date is in the future (computed property)
// • Check if a date is in the past (computed property)
// • Check if a date is in today (computed property)

extension Date{
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    // TODO: is in the future
    func isFuture() -> Bool {
        var now: Date = Date()

        return self > now
    }
    
    // TODO: is in the past
    func isPast() -> Bool {
        var now: Date = Date()

        return self < now
    }
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
let date: Date = formatter.date(from: "2018/03/20")!
let today = Date()
// TODO: test the written extension
print(today.isToday())
print(today.isPast())
print(today.isFuture())


// CLOSURES

// 25. (1 p) Declare a closure that takes an Integer as an argument and returns if the number is odd or even (using regular syntax and shorthand parameter names)
// ex: `let empty: (String) -> Bool = { $0.isEmpty }` - closure for testing if a string is empty

let oddOrEven: (Int) -> String = {
    $0 % 2 == 0 ? "Even" : "Odd"
}

// 26. (1 p) Use the above defined closure to filter out odd numbers from an array of random numbers (use the filter function)
func makeRandomList() -> [Int] {
    return [1, 43, 654, 32, 67, 23, 78, 94, 12, 67]
}

// TODO: do the filtering
let filterOdds = {
    (list: [Int]) -> [Int] in 
    list.filter({
        oddOrEven($0) == "Even"
    })
}

print(filterOdds(makeRandomList()))


// 27. (1 p) Declare a closure that takes 2 Integers as parameters and returns true if the first argument is larger than the second and false otherwise (using regular syntax and shorthand parameter names)

let larger: (Int, Int) -> Bool = (>)