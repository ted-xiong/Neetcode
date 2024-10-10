import Foundation

// MARK: My solution (seems like this is the best one!)
func isAnagram(_ s: String, _ t: String) -> Bool {
    
    // we'll probably want to do something similar to containsDuplicate. We can't use a set though, since we can have repeating elements. Perhaps a hashmap where we can store multiple values?
    
    var dict1 = Dictionary<Character, Int>()
    var dict2 = Dictionary<Character, Int>()
    
    // I guess we could have a character look up where we see how much of each character appears in the dictionary. If everything matches up, we're good.
    
    for char1 in s {
        if (dict1[char1] != nil) {
            dict1[char1]? += 1
        } else {
            dict1[char1] = 1
        }
    }
    
    for char2 in t {
        if (dict2[char2] != nil) {
            dict2[char2]? += 1
        } else {
            dict2[char2] = 1
        }
    }

    for character in t {
        guard let char = dict1[character] else {
            return false
        }
        
        if char != dict2[character] {
            return false
        } else {
            continue
        }
    }
    
    return true
}

isAnagram("anagram", "nagaram")
isAnagram("rat", "cat")

// man this is bad LOL 2ms runtime

// MARK: Recommend solution
class ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        // looks like they check for the count first.
        // Need to get better at catching these simple edge cases
        if s.count != t.count {
            return false
        }
        
        // They initialize two int dictionaries here
        var countS = [Int:Int]()
        var countT = [Int:Int]()
        
        // Followed by two arrays here to store the characters.
        // They convert the strings to an array of characters here.
        let sChars = Array(s)
        let tChars = Array(t)
        
        // Here they do a lot:
        // 1. They go through the character arrays and obtain the ascii value
        // 2. They type cast the ascii value to Int, then store it as the dictionary key
        
        // 3. Now they basically use the ascii value of the character as the key. On the left hand side, that's them using it as the key. The right hand side is them using the key to access the value.

        for i in 0..<sChars.count {
            // In other words, dict[i] = 1 + dict[i], which is effectively incrementing if it exists, and storing the key-value pair if it doesn't exist.
            
            // NOTE: They use defaults here to combat the optional-ness of these dictionary references.

            countS[Int(sChars[i].asciiValue!)] = 1 + countS[Int(sChars[i].asciiValue!), default: 0]
            countT[Int(tChars[i].asciiValue!)] = 1 + countT[Int(tChars[i].asciiValue!), default: 0]
            
            print("For letter \(sChars[i]) in first word")
            print("For letter \(tChars[i]) in second word")

            print("CountS keys and values for iteration \(i): \(Int(sChars[i].asciiValue!)), \(countS[Int(sChars[i].asciiValue!)] ?? 0)")
            print("CountT keys and values for iteration \(i): \(Int(tChars[i].asciiValue!)), \(countT[Int(tChars[i].asciiValue!)] ?? 0)")
            print()

        }
        
        // Here, we only care about the key while looping through the dictionary. Note the syntax.
        for (key, _) in countS {
            if countS[key] != countT[key, default: 0] {
                return false
            }
        }
        return true
    }
    
    // This approach is MUCH simplier and cleaner, but requires sorting and not instant look-up. Not a super-scalable solution.
    func isAnagramByLengthAndSortCheck(_ s: String, _ t: String) -> Bool {
        
        // if the String lengths don't match, then they cannot be anagrams of each other
        guard s.count == t.count else { return false }
        
        // sorting the String Characters puts them in the same order, which allows us to check equality
        guard s.sorted() == t.sorted() else { return false }
        
        // if both guards succeed, then we have an anagram
        return true
    }
}

ValidAnagram().isAnagram("anagram", "nagaram")
ValidAnagram().isAnagram("rat", "cat")
