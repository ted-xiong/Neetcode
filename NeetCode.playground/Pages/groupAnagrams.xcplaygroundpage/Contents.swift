// given an array of strings, group the anagrams together. You can return the answer in any order.



// MARK: My solution
func groupAnagrams(_ strs: [String]) -> [[String]] {
    // I think a good way to think about this is to go through the array of strings
    if strs.isEmpty {
        return [[""]]
    }
    
    var result = [[String]]()
    
    var dict: [Int:Int] = [:]
    var counter = 0
    
    for string in strs {
        // at the very end, if the sorted string doesn't exist in the dictionary as a key,
        // we add it to the dictionary -> [Set<Character>:counter] and increment the counter
        
        let sortedStringValue = string.sorted().hashValue
        
        if let index = dict[sortedStringValue] {
            result[index].append(string)
        } else {
            dict[sortedStringValue] = counter
            result.append([])
            result[counter].append(string)
            counter += 1
        }
    }
    
    print(result)
    return result
}

groupAnagrams(["eat", "tea","tan","ate","nat","bat"])
groupAnagrams([""])
groupAnagrams(["a"])




