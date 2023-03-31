func sumOfDigits(_ number: Int) -> Int {
    
    var number = number
    var sum: Int = 0
    var remainder: Int = 0
    
    while number > 0 {
        remainder = number%10
        sum += remainder
        number /= 10
    }
    
    return sum
}

print(sumOfDigits(823)) 