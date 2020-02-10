import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        guard nums.count > 1 else {
            if nums[0] == target {
                return 0
            } else {
                return -1
            }
        }
        
        var first = nums.first!
        var last = nums.last!
        var medianIndex = nums.count / 2
        var power = 1
        
        while medianIndex >= 0 && medianIndex < nums.count {
            let med = nums[medianIndex]
            if med == target {
                return medianIndex
            }
            
            var nextMed = 0
            if target < med {
                if target <= first {
                    nextMed = medianIndex + Int(ceil(Double(nums.count / 2) / pow(Double(2), Double(power))))
//                    first = nums[medianIndex]
                } else {
                    nextMed = medianIndex - Int(ceil(Double(nums.count / 2) / pow(Double(2), Double(power))))
//                    last = nums[medianIndex]
                }
            } else {
                if target <= last {
                    nextMed = medianIndex + Int(ceil(Double(nums.count / 2) / pow(Double(2), Double(power))))
//                    first = nums[medianIndex]
                } else {
                    nextMed = medianIndex - Int(ceil(Double(nums.count / 2) / pow(Double(2), Double(power))))
//                    last = nums[medianIndex]
                }
            }
            print(nextMed)
            print(medianIndex)
            print()
            if nextMed == medianIndex {
                if nums[nextMed] == target {
                    return medianIndex
                } else {
                    return -1
                }
            }
            
            power += 1
            medianIndex = nextMed
        }
        
        return -1
    }
}

print(Solution.init().search([4,5,6,7,0,1,2], 3)) // -1
//print(Solution.init().search([4,5,6,7,0,1,2], 4)) // 0
//print(Solution.init().search([4,5,6,7,0,1,2], 2)) // 6
