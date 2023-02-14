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