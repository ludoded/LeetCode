import UIKit

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxValue = 0
        var i = 0
        var j = height.count - 1
        while i < j {
            let h1 = height[i]
            let h2 = height[j]
            let d = j - i
            let area = d * min(h1, h2)
            if maxValue < area {
                maxValue = area
            }

            if h1 < h2 {
                i += 1
            } else {
                j -= 1
            }
        }

        return maxValue
    }
}
