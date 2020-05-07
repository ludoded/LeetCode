import UIKit

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var container: Set<Int> = []
        
        for num in nums {
            if container.contains(num) {
                container.remove(num)
            } else {
                container.insert(num)
            }
        }
        
        return container.first ?? 0
    }
}

print(Solution().singleNumber([4,1,2,1,2]))
