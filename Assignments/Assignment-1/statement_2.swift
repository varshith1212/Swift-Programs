import Foundation

func reverseString(sentence: String) -> String{
    
    var words = sentence.lowercased()
    words = String(words.reversed())
    words = words.capitalized
    
    return words
}

var word = readLine()

var ans = reverseString(sentence: word!)
print(ans)




