/*
Imagine that you are creating name cards for a group of international guests. 
Their names and home countries can be stored as key-value pairs in a dictionary:

i. guests = [ “Mike”: “Canada”, “Jane”: “Australia”, “Angela”: “Germany”, “Robert”: “Nigeria”]

Create a function that accepts a name as an input string and outputs a name card greeting that includes the person's name and country. 
For example, “I’m [name], and I’m from [country].” So, inputting Robert's name would output, "I'm Robert, and I'm from Nigeria. "
If a name isn't in the dictionary, then the output should just include the person's name.
*/

/*
func greeting(word: String, cards: [String: String?]) -> String{
    
    if cards[word] != nil {
        return "I'm \(word), and I'm from \(cards[word]!!)"
    }else {
        return "I'm \(word)"
    }
}

var guests = [ "Mike": "Canada", "Jane": "Australia", "varshith": nil]

print(greeting(word: "varshith", cards: guests))
*/

// if cards[word] == nil{} -- greeting(word: "Mike", cards: guests)        -- o/p: I'm Mike
// if cards[word] == nil{} -- greeting(word: "varshith", cards: guests)    -- o/p: I'm varshith

// if cards[word] != nil{} -- greeting(word: "Mike", cards: guests)        -- o/p: I'm Mike, and I'm from Canada
// if cards[word] != nil{} -- greeting(word: "varshith", cards: guests)    -- o/p: Unexpectedly found nil while unwrapping an optional value: file <>, line <>(at return)

import Foundation

func greeting(word: String, cards: [String: String]) -> String{
    
    if cards.keys.contains(word) {
        return "I'm \(word), and I'm from \(cards[word]!)" //without optional unwrapping, gives a warning
    }else {
        return "I'm \(word)"
    }
}

var guests = [ "Mike": "Canada", "Jane": "Australia", "Angela": "Germany", "Robert": "Nigeria"]

print(greeting(word: "varshith", cards: guests))

print(greeting(word: "Mike", cards: guests))

/*

func greeting(word: String, cards: [String: String?]) -> String {
    
    if let name = cards[word] as? String {
        return "I'm \(name), and I'm from \(String(describing: cards[name]))"
    } else {
        return "I'm \(word)"
    }
}

var guests = [ "Mike": "Canada", "Jane": "Australia", "varshith": nil]
print(greeting(word: "varshith", cards: guests))
*/

