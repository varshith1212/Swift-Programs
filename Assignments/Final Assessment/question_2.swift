func isPrime (number: Int) -> String {
    
    for i in 2...number-1 {
        if(number%i == 0) {
            return "Not Prime"
        }
    }
    return "Prime"
}

print(isPrime(number: 12))
print(isPrime(number: 3))