/**
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:

     2
    / \
   1   3

 Input: [2,1,3]
 Output: true
 Example 2:

     5
    / \
   1   4
      / \
     3   6

 Input: [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        var root = root
        var stack = [TreeNode]()
        var prev: TreeNode? = nil
        
        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            root = stack.popLast()
            if prev != nil && root!.val <= prev!.val {
                return false
            }
            prev = root
            root = root?.right
        }
        
        return true
    }
    
    func isValidBST_Rec(_ root: TreeNode?) -> Bool {
        return helper(root, nil, nil)
    }
    
    func helper(_ root: TreeNode?, _ minNode: TreeNode?, _ maxNode: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if minNode != nil && root!.val <= minNode!.val {
            return false
        }
        if maxNode != nil && root!.val >= maxNode!.val {
            return false
        }
        
        return helper(root?.left, minNode, root) && helper(root?.right, root, maxNode)
    }
}

let s = Solution()

let t = TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)))
s.isValidBST(t) // false
