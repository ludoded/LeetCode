/**
 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 Find all strobogrammatic numbers that are of length = n.

 Example:

 Input:  n = 2
 Output: ["11","69","88","96"]
 */

class Solution {
    let dict: [String: String] = [
        "9": "6",
        "6": "9",
        "8": "8",
        "0": "0",
        "1": "1"
    ]
    
    let middle: [String] = ["0", "1"]
    
    func findStrobogrammatic(_ n: Int) -> [String] {
        
    }
    
    func make() -> String {
        var str: [String] = []
        let mid = 1
        for key in dict.keys {
            for i in (0...1).reversed() {
                if i == mid {
                    str.append(middle[0])
                }
                str.append(<#T##newElement: String##String#>)
            }
        }
    }
}
