/**
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.

 If there are two middle nodes, return the second middle node.

  

 Example 1:

 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 Example 2:

 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
  

 Note:

 The number of nodes in the given list will be between 1 and 100.
 */


///Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil
            else { return head }
        
        var arr: [Int] = []
        var node = head
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
        
        var mediana: Double = Double(arr.count) / 2
        mediana.round(.down)
        let subarray = arr[Int(mediana)...]
        var prev: ListNode? = nil
        for val in subarray.reversed() {
            let node = ListNode(val)
            node.next = prev
            prev = node
        }
        
        return prev
    }
}

let n1 = ListNode(1)
n1.next = ListNode(2)
n1.next?.next = ListNode(3)
n1.next?.next?.next = ListNode(4)
n1.next?.next?.next?.next = ListNode(5)
dump(Solution().middleNode(n1)) // 3

let n2 = ListNode(1)
n2.next = ListNode(2)
n2.next?.next = ListNode(3)
n2.next?.next?.next = ListNode(4)
n2.next?.next?.next?.next = ListNode(5)
n2.next?.next?.next?.next?.next = ListNode(6)
dump(Solution().middleNode(n2)) // 4

let n3 = ListNode(1)
dump(Solution().middleNode(n3)) // 1

let n4: ListNode? = nil
dump(Solution().middleNode(n4)) // nil

let n5 = ListNode(1)
n5.next = ListNode(2)
dump(Solution().middleNode(n5)) // 2

