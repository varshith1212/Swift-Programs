 import Foundation
 
 func splitArray(numArray: [Int], value:Int) -> [[Int]] {
     
     var div : [Int] = []
     var nonDiv : [Int] = []
     
     for num in numArray {
         
         if num % value == 0 {
             div.append(num)
         } else {
             nonDiv.append(num)
         }
     }
     
     return [div,nonDiv]
 }
 
 var numArray = [3,5,18,10]
 var value = 3
 
 print(splitArray(numArray: numArray, value: value))