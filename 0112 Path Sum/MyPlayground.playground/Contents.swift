/**
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard root != nil else { return false }
        let nextSum = sum - (root?.val ?? 0)
        if nextSum == 0 && root?.left == nil && root?.right == nil { return true }
        
        var res: Bool = false
        if root?.left != nil {
            res = hasPathSum(root?.left, nextSum)
        }
        
        if root?.right != nil && res == false {
            res = hasPathSum(root?.right, nextSum)
        }
        
        return res
    }
}

let t1 = TreeNode(5)
t1.left = TreeNode(4)
t1.left?.left = TreeNode(11)
t1.left?.left?.left = TreeNode(7)
t1.left?.left?.right = TreeNode(2)
t1.right = TreeNode(8)
t1.right?.left = TreeNode(13)
t1.right?.right = TreeNode(4)
t1.right?.right?.right = TreeNode(1)

print(Solution().hasPathSum(t1, 18))
print(Solution().hasPathSum(nil, 0))

let t2 = TreeNode(1)
t2.left = TreeNode(2)
print(Solution().hasPathSum(t2, 1))

let t3 = TreeNode(-2)
t3.left = TreeNode(-3)
print(Solution().hasPathSum(t3, -5))
