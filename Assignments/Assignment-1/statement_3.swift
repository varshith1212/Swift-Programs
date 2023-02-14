/*
An isogram is a word that has no repeated letters. 
Create a function that accepts an input string and returns the repeated letter or 
letters if the word is not an isogram and “Is an Isogram” if the word is. 
So, an input of "tomorrow" would output ["o", "r"].
*/

import Foundation

func isogram(sentence: String) -> [String] {
    
    var letters: [Character: Int] = [:]
    var key : [String] = []
    
    for i in sentence {
        if letters.keys.contains(i) {
            letters[i]! += 1 
            if letters[i] == 2 {
                key.append(String(i))
            }
        } else {
            letters[i] = 1
        }
    } 
    
    if letters.values.max()! > 1 {
        return key
    } else {
        return ["Is an Isogram"] 
    }
}

var word = readLine()

var ans = isogram(sentence: word!)
print(ans)




