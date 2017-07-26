
// Basic enum


enum Weekday {
    case Monday, Tuesday, Wednesday, Thrusday, Friday
}

var today: Weekday
today = .Monday

switch today {
case .Monday:
    print("Yest")
case .Wednesday:
    print("no")
default:
    print("no")
}

// Rawvalues

enum State: Int {
    case ready = 0
    case set
    case go
}

var rs = State.set
rs.rawValue

var nextRS = State(rawValue: rs.rawValue + 1)

if nextRS == .go {
    print("GOOOOO!")
}

enum hwStatus {
    case none
    case wip(Int, Int)
    case done
    
    func desc() -> String {
        switch self {
        case .none:
            return "No hw"
        case .wip(let numComplete, let total):
            return "\(numComplete) out of \(total)"
        default:
            return "done"
        }
    }
}

var myHW = hwStatus.wip(2, 10)
myHW.desc()

myHW = hwStatus.wip(8, 10)
myHW.desc()

myHW = .done
myHW.desc()

// Associated values and functions


