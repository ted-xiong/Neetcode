// MARK: My solution
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

// MARK: Recommended solution
class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashSet = Set<Int>()
        for n in nums {
            
            // MARK: Forgot this check here. If it already contains it, we return true early.
            
            if hashSet.contains(n) {
                return true
            }
            hashSet.insert(n)
        }
        return false
    }
    
    func containsDuplicateByCountComparison(_ nums: [Int]) -> Bool {
        
        // a Set must contain unique items
        // so, if the count of `nums` is unequal to `nums` casted as a Set,
        // then, one or more items were removed,
        // meaning, there were one or more duplicates in `nums`
        if nums.count == Set(nums).count {
            return false
        } else {
            return true
        }
    }
}
