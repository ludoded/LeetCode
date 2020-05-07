/**
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 Example:
 Given a binary tree

           1
          / \
         2   3
        / \
       4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

 Note: The length of path between two nodes is represented by the number of edges between them.
 */

//Definition for a binary tree node.
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
    var result: Int = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        if root?.left == nil && root?.right == nil { return 0 }
        
        depthFirstSearch(root)
        
        return result - 1
    }
    
    func depthFirstSearch(_ root: TreeNode?) -> Int {
        var leftCount = 0
        var rightCount = 0
        
        if let left = root?.left {
            leftCount = depthFirstSearch(left)
        }
        
        if let right = root?.right {
            rightCount = depthFirstSearch(right)
        }
        
        result = max(result, leftCount + rightCount + 1)
        return max(leftCount, rightCount) + 1
    }
}

let t1 = TreeNode(1)
t1.left = TreeNode(2)
t1.left?.left = TreeNode(4)
t1.left?.right = TreeNode(5)
t1.right = TreeNode(3)
print(Solution().diameterOfBinaryTree(t1)) // 3

let t2 = TreeNode(0)
t2.left = TreeNode(0)
t2.left?.left = TreeNode(0)
t2.left?.left?.left = TreeNode(0)
t2.left?.right = TreeNode(0)
t2.left?.right?.right = TreeNode(0)
t2.left?.right?.right?.right = TreeNode(0)
t2.left?.right?.right?.right?.right = TreeNode(0)
print(Solution().diameterOfBinaryTree(t2)) // 6

let t3: TreeNode? = nil
print(Solution().diameterOfBinaryTree(t3)) // 0

let t4: TreeNode? = TreeNode(0)
print(Solution().diameterOfBinaryTree(t4)) // 0

let t5: TreeNode? = TreeNode(0)
t5?.right = TreeNode(0)
print(Solution().diameterOfBinaryTree(t5)) // 1
