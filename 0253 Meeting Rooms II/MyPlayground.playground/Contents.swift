/**
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

 Example 1:

 Input: [[0, 30],[5, 10],[15, 20]]
 Output: 2
 Example 2:

 Input: [[7,10],[2,4]]
 Output: 1
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let s = intervals.sorted(by: { $0[0] < $1[0] })
        var latestTime: [Int] = []
        
        for i in s {
            if let id = latestTime.firstIndex(where: { $0 <= i[0] }) {
                latestTime[id] = i[1]
            } else {
                latestTime.append(i[1])
            }
        }
        
        return latestTime.count
    }
}

let s = Solution()
print(s.minMeetingRooms([[0,30],[5,10],[15,20]])) // 2
