// MARK: Their solution (too tired today)

// We want to find all the possible products of the numbers in the array excluding the number that the iteration is currently on
// For example: [1, 2, 3, 4] should return [24, 12, 8, 6]

func productExceptSelf(_ nums: [Int]) -> [Int] {
    // The obvious method is to use division, but that's not allowed.
    
    // initialization of three different arrays
    var prefix = Array(repeating: 1, count: nums.count)
    var suffix = Array(repeating: 1, count: nums.count)
    var result = Array(repeating: 0, count: nums.count)

    // starting with the second entry in the array, stores the products of the proceeding entries
    // into an array
    for i in 1 ..< nums.count {
        prefix[i] = prefix[i - 1] * nums[i - 1]
        print("Prefix for \(i): ",prefix[i])
    }
    
    print("Prefix after loop: ", prefix)

    // starting with the last entry in the array, stores the products of the succeeding entries
    // into an array
    for i in (0 ..< nums.count - 1).reversed() {
        suffix[i] = suffix[i + 1] * nums[i + 1]
        print("Suffix for \(i): ", suffix[i])

    }
    
    print("Suffix after loop: ", suffix)

    // multiplies the two together
    for i in 0 ..< result.count {
        result[i] = prefix[i] * suffix[i]
    }
    
    return []
}

productExceptSelf([1,2,3,4])

