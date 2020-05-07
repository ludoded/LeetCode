/**
 (This problem is an interactive problem.)

 A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.

 Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.

 You can't access the Binary Matrix directly.  You may only access the matrix using a BinaryMatrix interface:

 BinaryMatrix.get(x, y) returns the element of the matrix at index (x, y) (0-indexed).
 BinaryMatrix.dimensions() returns a list of 2 elements [n, m], which means the matrix is n * m.
 Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

 For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.

  

 Example 1:



 Input: mat = [[0,0],[1,1]]
 Output: 0
 Example 2:



 Input: mat = [[0,0],[0,1]]
 Output: 1
 Example 3:



 Input: mat = [[0,0],[0,0]]
 Output: -1
 Example 4:



 Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
 Output: 1
  

 Constraints:

 1 <= mat.length, mat[i].length <= 100
 mat[i][j] is either 0 or 1.
 mat[i] is sorted in a non-decreasing way.
 */


protocol BinaryMatrix {
    func get(_ x: Int, _ y: Int) -> Int
    func dimensions() -> [Int]
}

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let dimensions = binaryMatrix.dimensions()
        let n = dimensions[0]
        let m = dimensions[1]
        
        guard n > 0 && m > 0 else { return -1 }
        
        var leastIndex: Int = .max
        
        for i in 0..<n {
            var left = 0
            var right = m
            var jMin: Int = .max
            while left < right {
                let jMid = Double(left + right) / 2
                let element = binaryMatrix.get(i, jMid)
                if element == 1 {
                    jMin = jMid
                    right = jMid
                } else {
                    left = jMid
                }
            }
            leastIndex = min(leastIndex, jMin)
        }
        
        return leastIndex == .max ? -1 : leastIndex
    }
}
