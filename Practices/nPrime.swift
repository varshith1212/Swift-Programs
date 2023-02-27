func nPrime (number: Int) {
    
    for i in 2...number {
        var count: Int = 0
        for j in 2...i {
            if(i%j == 0) {
                count += 1
            }
        }
        if(count == 1) {
            print(i)
        }
    }
}

nPrime(number: 15)