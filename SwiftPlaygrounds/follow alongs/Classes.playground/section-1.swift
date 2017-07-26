// Simple class


class account {
    var name: String
    var bal: Double
    
    init(name: String, bal: Double) {
        self.name = name
        self.bal = bal
    }
    
    func dep(amount: Double) {
        bal += amount
    }
    
    func withdraw(amount: Double) {
        bal -= amount
    }
}


var daveAccount = account(name: "Dave", bal: 100.00)
daveAccount.dep(amount: 50)
daveAccount.withdraw(amount: 10)

// Subclass

class Atm :account {
    var fee: Double
    let defaultFee: Double = 2.0
    
    override init (name: String, bal: Double) {
        fee = defaultFee
        super.init(name: name, bal: bal)
    }
    
    init (name: String, bal: Double, fee :Double) {
        self.fee = fee
        super.init(name: name, bal: bal)
    }
    
    init() {
        fee = defaultFee
        super.init(name: "Anon", bal: 0)
    }
}

var bobAccount = Atm()
bobAccount.dep(amount: 100)
bobAccount.withdraw(amount: 40)





