//: # Lesson 4 Exercises - Control Flow

import UIKit

//: ## Fast enumeration with for-in
//: ### Exercise 1
//: For each title in the array print the following string: "title + with Puppets", e.g "Point Break with Puppets!"
var movieTitleArray = ["Point Break", "The Dark Knight", "Star Wars", "When Harry Met Sally"]
for item in movieTitleArray{
    print("\(item) with Puppets! ")
}
//: ### Exercise 2
//: Rent is increasing by 20% this year. Use a for-in loop to apply this increase to each item in the oldMountainViewRent array.  Store the new values in the array newMountainViewRent.
var oldMountainViewRent:[Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newMountainViewRent = [Double]()
for item in oldMountainViewRent{
    [newMountainViewRent .append(item + item * 20/100)]
}
//: ### Exercise 3
//: For each food with a true value, print out "<food>, yum!" For each food with a false value print out, "<food>, yuck!"
var polarizingFoods = ["Anchovies":true, "Coconut":true, "Cilantro":true, "Liver": false]
for (food, isTrue) in polarizingFoods{
    if isTrue {
        print("\(food), yumi")
    }else{
        print("\(food), yuck")
    }
}
//: ### Exercise 4
//: The Oakland area code is changing from 415 to 510. Replace all occurrences of the area code 415 with 510 in the dictionary below.
var rapperPhoneNumbers = ["Azealia Banks":"(212)548-8777", "Boots Riley":"(415)755-9887", "MC Hammer":"(415)533-9899", "Missy Elliot":"(757)488-5552", "Shock G":"(415)499-7676", "Sir Mix-a-lot":"(206)123-4567", "Snoop Dogg":"(213)760-6664"]

for (area, code) in rapperPhoneNumbers{
    var newCode = [String]()
    newCode = [code .replacingOccurrences(of: "415", with: "510")]
    print("\(area):\(newCode)")
}

//: ## Switch Statements
//: Translate the following if-else statements into switch statements. Feel free to modify print statements as desired.
//: ### Exercise 5
//: Below is an if statement determining what team to cheer for given a sport.
enum Sport {
    case baseball, basketball, football, hockey, soccer
}

var sport = Sport.hockey
switch sport {
case .baseball:
    print("Go A's!")
case . basketball:
    print("Go Warriors!")
case .football:
    print( "Go Raiders!")
case .hockey:
    print("Go Sharks!")
case .soccer:
    print("Go Earthquakes!")
default:
    print("Invalid")
}

//: ### Exercise 6
//: Below is an enum and an if-else statement for implementing the game Rock-Paper-Scissors.
enum roshamboMove {
    case rock, paper, scissors
}

var myMove = roshamboMove.rock
var yourMove = roshamboMove.scissors

var resultsMessage = ""

switch (myMove, yourMove) {
case (.rock, .paper), (.paper, .rock):
    resultsMessage = "Paper covers Rock."
case (.scissors, .paper), (.paper, .scissors):
    resultsMessage = "Scissors cut Paper."
case (.rock, .scissors), (.scissors, .rock):
    resultsMessage = "Rock crushes Scissors."
default:
    resultsMessage = "It's a tie!"
}


//: ### Exercise 7
//: Below is an if-else statement matching an assignment score to a letter grade.
var score = 59
var letterGrade = ""

switch score {
case 90...100:
    letterGrade = "A"
case 80...89:
    letterGrade = "B"
case 70...79:
    letterGrade = "C"
case 60...69:
    letterGrade = "D"
default:
    letterGrade = "Incomplete"
}

//: ### Exercise 8
//: The if-else statement below translates a word into Pig Latin. Without using the "vowels" array, write an equivalent switch statement.

var word = "aan"
var firstLetter = word[word.startIndex]
var newWord = ""
var vowels: [Character] = ["a", "e", "i", "o", "u"]

switch firstLetter {
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
    word.remove(at: word.startIndex)
    newWord = "\(word)\(firstLetter)ay"
default:
    newWord = word + "yay"
}
