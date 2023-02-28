func stringPalindrome(_ word: String) -> Bool {
    
    if(word == String(word.reversed())) {
        return true
    }
    return false
}

print(stringPalindrome("teacher"))