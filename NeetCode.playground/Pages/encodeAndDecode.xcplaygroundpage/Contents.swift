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
    // ok this part is self-explanatory
    if strs.isEmpty { return "#" }
    
    // we have our array of... counts??
    var counts = [String]()
    
    // ok yeah this is what I was afraid of...
    
    // if we append the string with a "/" or any other character tacked on the end, if
    // any of the strings contains that character we're screwed
    
    // instead, here we use the count of each string, which makes sense
    for str in strs {
        counts.append("\(str.count)")
    }
    
    // for ["neet","code","love","you"], this returns 4,4,4,3#neetcodeloveyou
    return counts.joined(separator: ",") + "#" + strs.joined()
}

func decodeSolution(_ s: String) -> [String] {
    // simple
    if s == "#" { return [] }
    
    // finds index of the seperator between the number of characters in each string array and the string itself
    let index = s.firstIndex(of: "#")!
    
    // makes an array of strings off of the first numbers in the string. This would give us ["4", "4", "4", "3"] for 4,4,4,3#neetcodeloveyou
    // own commentary: not sure why we don't make an array of integers...
    let counts = String(s[s.startIndex...s.index(before: index)]).components(separatedBy: ",")
        
    // the index where the string begins
    var sIndex = s.index(after: index)
    
    // the answer
    var decodedStrings = [String]()
    
    // where the decoding happens
    for count in counts {
        
        // end index, calculated by taking the start index of the current word we're on and
        // offsetting it by the length of the word
        let endIndex = s.index(sIndex, offsetBy: Int(count)! - 1)
        
        // not entirely sure what the purpose of this is... I guess this is to make sure that
        // s[sIndex...endIndex] runs the way it's supposed to? Not sure.
        if sIndex > endIndex {
            decodedStrings.append("")
            continue
        }
        
        // append onto final answer array
        decodedStrings.append(String(s[sIndex...endIndex]))
        
        // move the string start index up to the next "word"
        sIndex = s.index(after: endIndex)
    }
    
    
    return decodedStrings
}

encodeSolution(["neet   ","code ","love  ","you "])
decodeSolution(encodeSolution(["neet   ","code ","love  ","you "]))



