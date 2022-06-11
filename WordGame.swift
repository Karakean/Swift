import Foundation
class Game {
  var hiddenString: String //string that has to be guessed
  var currString: String //only guessed letters
  var tries: Int //remaining tries

  init(str: String, level: Int){
    self.currString = ""
    self.hiddenString = str
    for letter in hiddenString{
      if (letter != " "){
        currString.append("_")
      }
      else {
        currString.append(letter)
      }
    }
    self.tries = (4-level)*3 //easy->9, medium->6, hard->3
  }
  
  func printGame(){
    print("Current string: \(currString)\nTries left: " +
          "\(tries)\nYour guess: ", terminator:"")
  }

  func replaceCharacter(myString: String, index: Int, 
                        newChar: Character) -> String {
    var chars = Array(myString)
    chars[index] = newChar
    let newString = String(chars)
    return newString
}

  func gameLoop(){
    while ((currString != hiddenString) && (tries > 0)){
      self.printGame()
      let inputString = readLine()!.uppercased()
      var letter: Character = " "
      for char in inputString{
        letter = char
        break //only first character from input matters
      }
      var isInString = false
      for (i, x) in hiddenString.enumerated(){
        if (x==letter){
          currString = replaceCharacter(myString: 
                                        currString, 
                                        index: i, 
                                        newChar: letter)
          isInString = true
        }
      }
      if (isInString == false){
        tries-=1
      }
    }
    print("Correct answer: \(hiddenString)")
    if (currString == hiddenString){
      print("You won!")
    }
    else {
      print("You lost.")
    }
  }
}

func chooseLevel()->Int{
  var input: String
  while true{
    print("\nChoose your diffictulty level.\n1-easy\n" + 
          "2-medium\n3-hard\nYour choice: ",terminator:"")
    input = readLine()!
    print()
    if ((input=="1")||(input=="2")||(input=="3")){
      let itr = Int(input) ?? 0 //int to return
      return itr
    }
    print("It's not a valid option.")
  }
}

var cities = ["GDAŃSK", "GDYNIA", "LOS ANGELES", 
              "NEW YORK", "ŚWINOUJŚCIE", "VANCOUVER",
              "WARSZAWA"]
var movies = ["INTERSTELLAR", "ME BEFORE YOU", 
              "REQUIEM FOR A DREAM", "12 ANGRY MEN", 
              "JURASSIC PARK", "FIGHT CLUB", 
              "SPIRITED AWAY"]
var games = ["LIFE IS STRANGE", "THE WITCHER", 
             "THE SIMS", "HEROES OF MIGHT AND MAGIC",
             "THE LAST OF US", "GRAND THEFT AUTO",
             "THE WALKING DEAD"]

func chooseCategory() -> String { //and return title
  var input: String
  let index = Int.random(in: 0..<7)
  while true{
    print("Choose your category.\n1-cities\n2-movies\n3-games\nYour choice: ",terminator:"")
    input = readLine()!
    print()
    switch input {
      case "1":
          return cities[index]
      case "2":
          return movies[index]
      case "3":
          return games[index]
      default:
          print("It's not a valid option.")
    }
  }
}

var input: String
repeat{
  let lvl: Int = chooseLevel()
  let title: String = chooseCategory()
  let game = Game(str: title, level:lvl)
  game.gameLoop()
  print("Press \"r\" to replay.")
  input = readLine()!
} while((input == "r")||(input == "R"))