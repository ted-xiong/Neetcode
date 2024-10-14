import Foundation
// Given an integer array nums and an integer k, return the k most frequent elements within the array.

// MARK: My solution
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    // we obviously need a dictionary. The one I'm thinking of is [number:occurences].
    // the tricky part is proceeding from here. We need a way to reference back the numbers from the number of occurences
    // I wonder if we can mutate the keys in the dictionary, that would be nice. But I don't think we can.
    // let's just build what we can for now:
    
    // remember the edge case:
    
    if nums.count == 1 {
        return [nums[0]]
    }
    
    var dict: [Int:Int] = [:]
    
    for num in nums {
        if var value = dict[num] {
            value += 1
            dict[num] = value
        } else {
            dict[num] = 1
        }
    }
        
    // here we want to find some sort of way to sort the dictionary of values in accordance with the occurences.
    
    // had to ChatGPT this one unfortunately. This is a syntax I need to master.
    let sortedDict = dict.sorted { $1.value < $0.value }

    // so now we'll have a dictionary sorted by its values, which is nice because now we just have to iterate through the dictionary and get the key of the first k entries
    
    // sortedDict is a tuple, which means we just have to iterate through it and get the first k entries
    var counter = 1
    var answer: [Int] = []
    
    print(sortedDict)
    
    for i in 0..<k {
        answer.append(sortedDict[i].0)
    }

    return answer
}

topKFrequent([1,1,1,2,2,3], 2)


// MARK: Their solution

func topKFrequentSolution(_ nums: [Int], _ k: Int) -> [Int] {
    
    // initialized a dictionary yep
    var frequencyDict = [Int: Int]()
    
    // ok this syntax is much simplier...
    for num in nums {
        
        // I need to use default more. This is literally so clean.
        // Unless I'm trying to do something WITH the value afterwards,
        // just stick with this
        frequencyDict[num, default: 0] += 1
    }
    
    // sorted syntax again, from ChatGPT. I mean, just at a glance it makes sense.
    // "I want the current entry to be greater than the next one"
    let sortedDict = frequencyDict.sorted { $0.value > $1.value }
    
    // got our result
    var result = [Int]()
    
    // and our for-loop
    for i in 0 ..< k {
        result.append(sortedDict[i].key)
    }
    
    // and voila...
    return result
}
