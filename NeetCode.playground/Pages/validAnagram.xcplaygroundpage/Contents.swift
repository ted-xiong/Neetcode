import Foundation

// MARK: My solution
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
