import Foundation

// Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.

// MARK: My solution

// Thought process: pretty self explanatory...?
func encode(_ strs: [String]) -> String {
    var string = ""
    
    for str in strs {
        string.append(str + "/")
    }
    
    return string
}

func decode(_ s: String) -> [String] {
    var ans: [String] = []
    
    s.split(separator: "/").map { substring in
        ans.append(String(substring))
    }
    
    return ans.dropLast()
}



