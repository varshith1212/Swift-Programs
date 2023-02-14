/*
Create a function that accepts a string as an input. If the string ends in "-s," then the string should return TRUE to indicate that the word is plural. Otherwise, it should return FALSE. Keep in mind that the function should return a Boolean value (TRUE or FALSE) and not a string value ("true" or "false").
*/

func plural(word: String) -> Bool{
    if String(word.suffix(2)) == "-s"{
        return true
    }else{
        return false
    }
}

var word = readLine()

var ans = plural(word: word!)
print(ans)