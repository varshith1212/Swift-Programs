func count(sourceText:String){

    var text = sourceText.lowercased()
    
    //can also use .components of Foundation which returns array of strings
    // whereas .split returns array of substrings, due to which String() should be used.
    // var words = text.components(seperatedBy:" ")
    
    var words = text.split(separator: " ") 
    
    var wordCount : [String: Int] = [:]
    
    for word in words{
        if wordCount[String(word)] == nil{
            wordCount[String(word)] = 1
        }
        else{
            wordCount[String(word)]! += 1
        }
    }
    
    print("\(wordCount.count) words")
    
    var sortedWords = wordCount.sorted{ (word1, word2) -> Bool in
        return word1.value > word2.value
    }
    
    var i = 1
    for word in sortedWords{
        print("\(i). \(word.key) - \(word.value)")
        i += 1
    }
}

count(sourceText: "Hello everyone this is varshith i like to code and this is sai who also like to code and code")