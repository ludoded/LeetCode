/**
 Given a collection of intervals, merge all overlapping intervals.

 Example 1:

 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res: [[Int]] = []
        
        guard intervals.count > 1 else { return intervals }
        
        var min = intervals.first!.first!
        var max = intervals.first!.last!
        
        for interval in intervals[1...] {
            if min <= interval.first! && max >= interval.first! && max <= interval.last! {
                max = interval.last!
            } else if min >= interval.first! && max <= interval.last! {
                min = interval.first!
                max = interval.last!
            } else if min <= interval.first! && max >= interval.last! {
                continue
            } else {
                res.append([min, max])
                min = interval.first!
                max = interval.last!
            }
        }
        
        res.append([min, max])
        
        return res
    }
}

print(Solution().merge([[1,3], [2,6], [8,10], [15,18]]))
print(Solution().merge([[1,4], [4,5]]))
print(Solution().merge([[1,4], [0,4]]))
print(Solution().merge([[1,4], [0,8]]))
print(Solution().merge([[1,4], [2,3]]))
