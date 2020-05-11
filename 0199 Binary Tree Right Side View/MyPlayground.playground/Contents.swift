/**
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---
 */

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        
        dfs(root, &res, 1)
        
        return res
    }
    
    func dfs(_ root: TreeNode?, _ res: inout [Int], _ depth: Int) {
        if root == nil {
            return
        }
        if depth > res.count {
            res.append(root!.val)
        }
        
        dfs(root?.right, &res, depth + 1)
        dfs(root?.left, &res, depth + 1)
    }
}

let s = Solution()
let t = TreeNode(1, TreeNode(2, nil, TreeNode(5)), TreeNode(3, nil, TreeNode(4)))
print(s.rightSideView(t)) // [1,3,4]

let t2 = TreeNode(1, TreeNode(2, TreeNode(4), nil), TreeNode(3))
print(s.rightSideView(t2)) // [1,3,4]

let t1 = TreeNode(1, TreeNode(2), nil)
print(s.rightSideView(t1)) // [1,2]
