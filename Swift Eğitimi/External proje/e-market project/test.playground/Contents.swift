import Foundation

var array: [Int] = [2,11,6,7,21,142]
let target: Int = Int.random(in: 0..<1000)

func finder(array: [Int], target: Int) -> Any {
    var counter: Int = 0
    var resultArray: [Int] = []
    var result: [Int] = []
    
    for numbers in array {
        counter = numbers
        for anotherNumbers in array {
            if anotherNumbers + counter == target {
                resultArray.append(anotherNumbers)
                resultArray.append(counter)
                if resultArray.count == 2 {
                    result.append(array.firstIndex(of: anotherNumbers) ?? 0)
                    result.append(array.firstIndex(of: counter) ?? 0)
                    return result
                } else {
                    print("Can't find any matches!")
                }
            }
        }
    }
    return "Error!! target is not acceptable for array! Because target: \(target)"
}

finder(array: array, target: target)
