func numberPalindrome(_ number: Int) -> Bool {
    
    let snum = String(number)
    if(snum == String(snum.reversed())) {
        return true
    }
    return false
}

print(numberPalindrome(100))