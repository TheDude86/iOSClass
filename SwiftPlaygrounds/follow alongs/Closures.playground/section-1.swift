var values = [10, 5, 2, 8, 3, 6, 1, 1000]

// Verbose Closure

var over5 = values.reduce(0, {(total: Int, current: Int) -> Int in

    return current > 5 ? (total + 1) : total
})


// Closure parameter name shorthand and trailing closure
var over9 = values.reduce(0, {$0 + ($1 > 9 ? 1 : 0)})
over9


// A Closure using a closure for a variable









//numValuesOverLimit(values, limit: 5)
//numValuesOverLimit(values, limit: 9)
