func Prime (number: Int) -> Bool{
    
    for i in 2...number-1 {
        if(number%i == 0) {
            return false
        }
    }
    return true
}

print(Prime(number: 12))