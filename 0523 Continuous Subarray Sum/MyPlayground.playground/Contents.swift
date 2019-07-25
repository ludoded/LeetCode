import UIKit

class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 1 else {
            return false
        }

        if k == 0 {
            var indecies: [Int] = []
            for (i, v) in nums.enumerated() where v == 0 {
                indecies.append(i)
                if indecies.contains(i-1) {
                    return true
                }
            }

            return false
        }

        for (i, val) in nums.enumerated() {
            var sum = val
            var j = i + 1
            while j < nums.count {
                sum += nums[j]
                if sum % k == 0 {
                    return true
                }

                j += 1
            }
        }

        return false
    }
}

print(Solution().checkSubarraySum([23, 2, 6, 4, 7], 6))
print(Solution().checkSubarraySum([25,1,3,2,9], 6))
print(Solution().checkSubarraySum([23, 2, 6, 4, 9], 100))
print(Solution().checkSubarraySum([], 0))
print(Solution().checkSubarraySum([0], 0))
print(Solution().checkSubarraySum([0,0], 0))
print(Solution().checkSubarraySum([0,1,0], 0))
