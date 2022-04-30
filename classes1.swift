//Exercise 1.1
var a = 5
var b = 10
var sum = "\(a) + \(b) = \(a+b)"
print(sum)

//Exercise 1.2
var string1 = "Gdansk University of Technology"
var string2 = ""
for character in string1{
    if character == "n" {
        string2 = string2 + "⭐️"
        continue
    }
    string2 = "\(string2)\(character)"
}
print(string2)    

//Exercise 1.3
var myname = "Mikołaj Nowak"
var revname = ""
for character in myname{
    revname = "\(character)\(revname)"
}
print(revname) 


//Exercise 2.1
for _ in 1...11 {
    print("I will pass this course with best mark, because Swift is great!")
}

//Exercise 2.2
let N = 5
var square = 0
for i in 1...N {
    square = i*i
    print(square)
}

//Exercise 2.3
let N2 = 4
for _ in 1...N2 {
    for _ in 1...N2 {
        print("@", terminator: "")
    }
    print("")
}

//Exercise 3.1
var numbers = [5, 10, 20, 15, 80, 13]
var max = numbers[0]
for nb in numbers{
  if max < nb{
    max = nb
  }
}
print("\(max)")

//Exercise 3.2
var revnumbers = Array<Int>()
revnumbers = numbers.reversed()
for number in revnumbers {
  print("\(number)", terminator: ", ")
} 
print("")

//Exercise 3.3
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var uniqueNumbers = Array<Int>()
var isUnique = true
for num in allNumbers{
  isUnique = true
  for uniNum in uniqueNumbers{
    if num == uniNum {
      isUnique = false
    }
  }
  if isUnique == true {
    uniqueNumbers.append(num)
  }
}
print("\(uniqueNumbers)")


//Exercise 4.1
var number2 = 10
var divisors = Set<Int>()
for i in 1...number2 {
  if(number2%i == 0){
    divisors.insert(i)
  }
}
var divisors_sorted = divisors.sorted()
print("\(divisors_sorted)")

//Exercise 5.1
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]
var flightNumbers = Array <String> ()
for flight in flights { 
  flightNumbers.append(flight["flightNumber"] ?? "NIL")
}
print("\(flightNumbers)")

//Exercise 5.2
var names = ["Hommer","Lisa","Bart"]
var fullName: [[String:String]] = []
for name in names {
  fullName.append(["lastName" : "Simpson", "firstName" : name])
}
print("\(fullName)")