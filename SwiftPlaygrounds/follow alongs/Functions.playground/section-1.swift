
// Basic function

func stringRepeater(str: String, count: Int) -> String {
    var output = ""
    
    for _ in 0..<count {
        output += str
    }
    
    return output
}




stringRepeater(str: "Ho! ", count: 3)
stringRepeater(str: "New York! ", count: 2)





// Returning a tuple (multiple return values)

func stringLetterRepeater(org: String, count: Int) -> (String, String) {
    var repeated = ""
    for _ in 0..<count {
        repeated += org
    }
    
    var repLetters = ""
    for letter in org.characters {
        repLetters += String(repeating: String(letter), count: count)
    }
    
    return (repeated, repLetters)
}




var collated : String, uncollated : String
(collated, uncollated) = stringLetterRepeater(org: "Ow! ",count: 4)
collated
uncollated







// Internal/External names plus Optional parameters

func stringDoubler(org: String, count: Int = 2) -> String {
    var output = ""
    
    for _ in 0..<count {
        output += org
    }
    
    return output
}





stringDoubler(org: "Woof! ", count: 3)
stringDoubler(org: "Jingle Bells! ")
