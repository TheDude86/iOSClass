// We already know about constants vs variables but there is another choice always present.
var x = 7
var f : Float = 7
let dave = "Dave"
//dave = "Bob"


// Optionals
var opFloat: Float?
var reqFloat: Float

print("optional = \(String(describing: opFloat))")

opFloat = 5.0
reqFloat = 5.0




// Optionals with forced unwrapping
var ten = "10"
var opThatsNil : Int? = Int(dave)
var opThatsNotNil : Int? = Int(ten)
//var reqThatsNil : Int = Int(dave)
var reqThatsNotNil : Int = Int(ten)!


// Views in a Playground + Optional Chaining
import UIKit

var b = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
b.setTitle("Press me", for: .normal)
b.backgroundColor = UIColor.red
b.titleLabel?.text
b.titleLabel!.text!

// Optional Binding

if let t = Int(ten) {
    print(t)
} else {
    print("Was nil")
}

if let t = Int(dave) {
    print(t)
} else {
    print("Was nil")
}
