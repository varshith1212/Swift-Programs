func sayBig(A number_1: Int, B number_2: Int) -> String {
    
    if(number_1 == number_2) {
        return "Both are same"
    }else if (number_1 > number_2) {
        return "A is big"
    }else {
        return "B is big"
    }
    
}

print(sayBig(A: 823, B: 1000))
print(sayBig(A: 823, B: 823)) 
print(sayBig(A: 823, B: 328)) 