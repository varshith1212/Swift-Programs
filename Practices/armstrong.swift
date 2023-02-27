func armstrong(number: Int) -> Bool{
    
    var num = number
    var sum: Int = 0
    var remainder: Int = 0
    while(num > 0){
        remainder = num%10
        sum += remainder*remainder*remainder
        num /= 10 
    }
    if (sum == number ){
        return true
    }
    return false
}

print(armstrong(number: 153))