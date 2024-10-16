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

// MARK: What the hell is this solution???

func encodeSolution(_ strs: [String]) -> String {
        if strs.isEmpty { return "#" }
        var counts = [String]()
        for str in strs {
            counts.append("\(str.count)")
        }
        return counts.joined(separator: ",") + "#" + strs.joined()
    }

func decodeSolution(_ s: String) -> [String] {
    if s == "#" { return [] }
    let index = s.firstIndex(of: "#")!
    let counts = String(s[s.startIndex...s.index(before: index)]).components(separatedBy: ",")
    var sIndex = s.index(after: index)
    var decodedStrings = [String]()
    for count in counts {
        let endIndex = s.index(sIndex, offsetBy: Int(count)! - 1)
        if sIndex > endIndex {
            decodedStrings.append("")
            continue
        }
        decodedStrings.append(String(s[sIndex...endIndex]))
        sIndex = s.index(after: endIndex)
    }
    return decodedStrings

}

