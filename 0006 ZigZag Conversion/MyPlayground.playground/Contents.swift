/**
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard !s.isEmpty else { return s }
        guard numRows > 1 else { return s }
        
        var isDown = true
        var res: [[String.Element]] = Array(repeating: [], count: numRows)
        var counter = 0
        
        for c in s {
            res[counter].append(c)
            
            if counter == 0 {
                isDown = true
            } else if counter == (numRows - 1) {
                isDown = false
            }
            
            if isDown {
                counter += 1
            } else {
                counter -= 1
            }
        }
        
        let resStr = res.flatMap({ $0 }).map({ String($0) }).joined()
        return resStr
    }
}

print(Solution().convert("PAYPALISHIRING", 3))
print(Solution().convert("AB", 1))
