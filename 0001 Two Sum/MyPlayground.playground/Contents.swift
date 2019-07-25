import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        nums.enumerated().forEach({ dict[$1] = $0 })
        dump(dict)
        for (i, firstNum) in nums.enumerated() {
            let sub = target - firstNum
            if let j = dict[sub], i != j {
                return [i, j]
            }
        }

        return []
    }
}

print(Solution().twoSum([3,2,4], 6))
