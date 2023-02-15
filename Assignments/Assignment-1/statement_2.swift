/*
Create a function that takes an input string and reverses its order and also switches capitalization so that each new word is capitalized. For example, "I love India!" should return "!Aidni Evol I."
*/

import Foundation

func reverseString(sentence: String) -> String{
    
    String(sentence.reversed())
    
    /*
    var words = sentence.lowercased()
    words = String(words.reversed())
    words = words.capitalized
    
    return words
    */
}


var ans = reverseString(sentence: "I love India!")
print(ans)




