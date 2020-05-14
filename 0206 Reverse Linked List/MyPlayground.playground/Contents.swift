/**
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node: ListNode? = head
        var prev: ListNode? = nil
        while node != nil {
            let next = node?.next
            node?.next = prev
            prev = node
            node = next
        }
        
        return prev
    }
}

let s = Solution()
let l = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
dump(s.reverseList(l))
