func Fibonacci (number: Int){
    
    var a: Int = 0
    var b: Int = 1
    var c: Int = 0
    for _ in 1...number {
        print(c)
        a = b
        b = c
        c = a + b
    }
}

print(Fibonacci(number: 10))