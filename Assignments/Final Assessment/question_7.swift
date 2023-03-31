func stringPalindrome(_ word: String) -> String {
    
    if(word == String(word.reversed())) {
        return "Palindrome"
    }
    return "Not a Palindrome"
}

print(stringPalindrome("madam"))