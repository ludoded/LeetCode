/**
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Example:

 You may serialize the following tree:

     1
    / \
   2   3
      / \
     4   5

 as "[1,2,3,null,null,4,5]"
 Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
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


class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard root != nil else { return "" }
        var arr: [Int?] = []
        var nodes = [root]
        
        while !nodes.isEmpty {
            var n: [TreeNode?] = []
            
            for node in nodes {
                arr.append(node?.val)
                n.append(node?.left)
                n.append(node?.right)
            }
            if n.contains(where: { $0 != nil }) {
                nodes = n
            } else {
                break
            }
        }
        
        var res: String = ""
        for n in arr {
            if n != nil {
                res.append(String(n!))
            } else {
                res.append("null")
            }
            res.append(" ")
        }
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var comps = data.split(separator: " ").map { (s) -> TreeNode? in
            return s == "null" ? nil : TreeNode(Int(s)!)
        }
        
        var k = 0
        var i = 1
        print(comps)
        
        while k < comps.count {
            let length = 1 << i
            
            var j: Int = k+1
            while (k+1)...length ~= j {
                
            }
            
            
            k += 1
        }
        
        return node.first!
    }
}

// Your Codec object will be instantiated and called as such:
// var codec = Codec()
// codec.deserialize(codec.serialize(root))

var codec = Codec()
let t1 = TreeNode(1)
t1.left = TreeNode(2)
t1.right = TreeNode(3)
t1.right?.left = TreeNode(4)
t1.right?.right = TreeNode(5)

print(codec.deserialize(codec.serialize(t1)))
