func isPrime (number: Int) -> Bool {
    
    if(number == 1 || number == 2) {
        return true
    } else {
        for i in 2...number-1 {
            if(number%i == 0) {
                return false
            }
        }
        return true
    }
    
}

func noOfPrimes (number: [Int]) -> Int {
    
    var count: Int = 0
    for i in number {
        if(isPrime(number: i)) {
            count += 1
        }
    }
    return count
}

print(noOfPrimes(number: [1,2,3,4,5,6,7,8,9,10,13]))