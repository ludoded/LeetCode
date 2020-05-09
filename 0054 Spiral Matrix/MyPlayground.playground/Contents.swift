/**
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

 Example 1:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:

 Input:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var matrix = matrix
        var direction = 0 // 0 - right, 1 - down, 2 - left, 3 - up
        var result: [Int] = []
        
        while !matrix.isEmpty && !matrix[0].isEmpty {
            if direction == 0 {
                result.append(contentsOf: matrix.removeFirst())
                direction = 1
            } else if direction == 1 {
                let rows = matrix.count
                for i in 0..<rows {
                    result.append(matrix[i].removeLast())
                }
                direction = 2
            } else if direction == 2 {
                result.append(contentsOf: matrix.removeLast().reversed())
                direction = 3
            } else if direction == 3 {
                let rows = matrix.count
                for i in (0..<rows).reversed() {
                    result.append(matrix[i].removeFirst())
                }
                direction = 0
            }
        }
        
        return result
    }
}

let matrix = [
[1, 2, 3, 4],
[5, 6, 7, 8],
[9,10,11,12]
]
print(Solution().spiralOrder(matrix))

let matrix2 = [[7],[9],[6]]
print(Solution().spiralOrder(matrix2))

let matrix3 = [[7],[9]]
print(Solution().spiralOrder(matrix3))

let matrix4 = [[7]]
print(Solution().spiralOrder(matrix4))

let matrix5: [[Int]] = []
print(Solution().spiralOrder(matrix5))

