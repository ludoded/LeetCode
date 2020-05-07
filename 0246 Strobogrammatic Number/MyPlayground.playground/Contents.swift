/**
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 Write a function to determine if a number is strobogrammatic. The number is represented as a string.

 Example 1:

 Input:  "69"
 Output: true
 Example 2:

 Input:  "88"
 Output: true
 Example 3:

 Input:  "962"
 Output: false
 */

class Solution {
    let dict: [String: String] = [
        "9": "6",
        "6": "9",
        "8": "8",
        "0": "0",
        "1": "1"
    ]
    
    func isStrobogrammatic(_ num: String) -> Bool {
        var start = 0
        var end = num.count - 1
        let arr = Array(num.map({ String($0) }))
        
        while start <= end {
            if !validate(arr[start], arr[end]) {
                return false
            }
            start += 1
            end -= 1
        }
        
        return true
    }
    
    func validate(_ f: String, _ s: String) -> Bool {
        if dict.keys.contains(f) {
            return dict[f] == s
        }
        return false
    }
}


print(Solution().isStrobogrammatic("69")) // true
print(Solution().isStrobogrammatic("96")) // true
print(Solution().isStrobogrammatic("88")) // true
print(Solution().isStrobogrammatic("808")) // true
print(Solution().isStrobogrammatic("692")) // false
print(Solution().isStrobogrammatic("777")) // false
