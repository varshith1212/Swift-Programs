func sumEvenArray (number: [Int]) -> Int {
    
    var sum: Int = 0
    for i in number {
        if(i%2 == 0) {
            sum += i
        }
    }
    return sum
}

print(sumEvenArray(number: [1,2,3,4,5,6,7,8,9,10]))