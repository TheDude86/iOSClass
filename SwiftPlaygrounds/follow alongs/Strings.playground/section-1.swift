//import UIKit

// String Concatenation
var myStr = "Hello," + " world"

// String append
myStr += "!"

// Looping over a string
for char in myStr.characters {
    print(char)
}


// String size
myStr.characters.count


// String Interpolation
var x = 7
var math = "\(x)^2 is \(x^2) not \(x * x) because ^ is XOR."

// Checking for equality
let dave = "Dave"
let name = "Dave"

if name == dave {
    print("Same")
}

import Foundation

// Finding a String within a String
if let range = name.range(of: "av") {
    print(range)
}


// Finding a Character within a String
var hw = "hello world"



// Substrings
let index = hw.index(hw.startIndex, offsetBy: 5)
hw.substring(to: index)

