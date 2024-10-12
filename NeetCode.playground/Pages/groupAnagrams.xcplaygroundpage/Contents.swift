// given an array of strings, group the anagrams together. You can return the answer in any order.

// MARK: My solution
func groupAnagrams(_ strs: [String]) -> [[String]] {
    if strs.isEmpty {
        return [[""]]
    }
    
    // I think a good way to think about this is to go through the array of strings once and once only
    var result = [[String]]()
    
    var dict: [Int:Int] = [:]
    var counter = 0
    
    for string in strs {
        // at the very end, if the sorted string doesn't exist in the dictionary as a key,
        // we add it to the dictionary -> [hashvalue:counter] and increment the counter
        
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

// MARK: Their solution

func groupAnagramsSolution(_ strs: [String]) -> [[String]] {
    // instead of creating a dictionary of [word:index], they just did a [String:String] dictionary. Interesting...
    var dict = [String: [String]]()
    
    // looping through the strings once like I did
    for str in strs {
        
        // they sort it just like I did. But to remove the error, they type-cast it here.
        let sortedStr = String(str.sorted())
        
        // ahhh ok this makes sense. They append it to the value.
        // I was not aware of this API... cool stuff!
        dict[sortedStr, default: []].append(str)
    }

    // dict.values actually is satisfactory, but we need to type-cast it for the sake of the return type.
    print(dict.values)
    return Array(dict.values)
}

groupAnagramsSolution(["eat", "tea","tan","ate","nat","bat"])
groupAnagramsSolution([""])
groupAnagramsSolution(["a"])


