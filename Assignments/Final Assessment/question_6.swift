func swapTwoNumbers(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var number_1 = 5
var number_2 = 10

print("Before swapping: x = \(number_1), y = \(number_2)")

swapTwoNumbers(&number_1, &number_2)

print("After swapping: x = \(number_1), y = \(number_2)")
