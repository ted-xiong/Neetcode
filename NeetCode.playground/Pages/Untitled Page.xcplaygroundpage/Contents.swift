func containsDuplicate(_ nums: [Int]) -> Bool {
    
    // solution: create a set off of nums, iterate through the nums array, and append to the set.
    
    // compare the set count with the nums count. If the two match, then there are no duplicates.
    
    var set = Set<Int>()
    
    for num in nums {
        set.insert(num)
    }
    
    if set.count != nums.count {
        return true
    } else {
        return false
    }
}
