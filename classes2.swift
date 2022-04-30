//Exercise 1.1
func minValue(_ a: Int, _ b: Int) ->Int {
  if (a <= b){
    return a
  }
  return b
}
print(minValue(8,3))

//Exercise 1.2
func lastDigit(_ a: Int) -> Int {
  return a%10
}
print(lastDigit(14364))

//Exercise 1.3
func divides(_ dividend: Int, _ divisor: Int) -> Bool {
  if (dividend%divisor == 0){
    return true
  }
  return false
}
func countDivisors(_ number: Int) -> Int {
  var counter = 0
  for i in 1...number{
    if(divides(number, i)){
      counter += 1
    }
  }
  return counter
}
func isPrime(_ number: Int) -> Bool {
  if (countDivisors(number) <= 2){
    return true
  }
  return false
}
print(divides(7,3))
print(divides(8,4))
print(countDivisors(1))
print(countDivisors(10))
print(countDivisors(12))
print(isPrime(3))
print(isPrime(8))
print(isPrime(13))


//Exercise 2.1
func smartBart(n: Int, f:()->()) {
  for _ in 1...n{
    f()
  }
}
smartBart (n: 5){
  print("I will pass this course with best mark, because Swift is great!")
}
//Exercise 2.2
let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
let filtered = numbers.filter{$0%4 == 0}
print(filtered)

//Exercise 2.3
let largest = numbers.reduce(Int.min){max($0, $1)}
print(largest)

//Exercise 2.4
let strings = ["Gdansk", "University", "of", "Technology"]
let combined = strings.reduce(""){$0 + " " + $1}
print(combined)

//Exercise 2.5
let numbers2 = [1,2,3,4,5,6]
let odd = numbers2.filter{$0%2 != 0}
let squared = odd.map{$0*$0}
let sum = squared.reduce(0){$0+$1}
print(sum)


//Exercise 3.1
func minmax(_ a: Int, _ b: Int) -> (Int, Int){
  if a<=b {
    return (a,b)
  }
  return (b,a)
}
print(minmax(10,5))
print(minmax(6,11))

//Exercise 3.2
var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of",  "technology", "technology", "gdansk", "gdansk"]
var countedStrings: [(String, Int)] = []
for string in stringsArray{
  var isAlready = false
  var currCount = 0
  for (string2, count) in countedStrings{
    if (string2 == string){
      isAlready = true
      currCount = count
      break;
    }
  }
  if (isAlready == true){ //removing
    countedStrings = countedStrings.filter() {$0 != (string,currCount)} 
  }
  countedStrings.append((string, currCount + 1))
}
print(countedStrings)


//Exercise 4.1
enum Day: Int {
  case Monday = 1
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
  case Saturday
  case Sunday
  func displayEmoji() -> () {
    switch self {
      case .Monday:
        print("🤬")
      case .Tuesday:
        print("🤡")
      case .Wednesday:
        print("😂")
      case .Thursday:
        print("🤓")
      case .Friday:
        print("😬")
      case .Saturday:
        print("😳")
      case .Sunday:
        print("💀")
    }
  }
}
let day = Day(rawValue: 5) ?? Day.Monday
day.displayEmoji()
