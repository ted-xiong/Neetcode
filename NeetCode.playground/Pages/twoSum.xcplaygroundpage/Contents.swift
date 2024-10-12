import Foundation


// MARK: Recommended solution (zzz)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var prevMap = [Int:Int]()
    
    // when you enumerate something, you get a tuple in each iteration. The first value in the tuple
    // iteration number itself, and the second one is the value in the sequence
    for (index, number) in nums.enumerated() {
        
        // we calculate difference here.
        let diff = target - number
        
        
        // we grab the index of the difference. We already have the other number and index (supplied through index and number)
        // so all we have to do is get the other one (supplied by prevMap[diff] and firstIndex
        if let firstIndex = prevMap[diff] {
            return [firstIndex, index]
        }
        
        // we essentially store the tuple as a dictionary key-value pair, with the key being the number
        // and the value being the index
        prevMap[number] = index
    }
    
    return []
}


// This one I had to cheat a little. Felt really tired. Be sure to lock this one in...


// This is for me to try again on Day 2 because I slacked on the last one.
func twoSumRetry(_ nums: [Int], _ target: Int) -> [Int] {
    
}
