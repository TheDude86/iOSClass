//: Playground - noun: a place where people can play

var variable = 43
variable = 49
let a = 9
//a = 19

let ar = [1, 3, 1, 422, 53]
var count = 0
for x in ar {
    if x > 3 {
        count += 1
    }
}

count
print("\(count) over 3 out of \(ar.count)")
