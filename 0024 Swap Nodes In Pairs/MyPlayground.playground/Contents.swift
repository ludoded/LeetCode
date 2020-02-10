/**
 *Given a linked list, swap every two adjacent nodes and return its head.

 You may not modify the values in the list's nodes, only nodes itself may be changed.

  

 Example:

 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        let result = head?.next
        var firstHead = head
        var prev: ListNode? = nil
        
        while firstHead?.next != nil {
            let head1 = firstHead
            let head2 = firstHead?.next
            
            head1?.next = head2?.next
            firstHead = head1?.next
            head2?.next = head1
            prev?.next = head2
            prev = head1
        }
        
        return result
    }
}


let ll2 = ListNode(0)
ll2.next = ListNode(1)
ll2.next?.next = ListNode(2)
ll2.next?.next?.next = ListNode(3)
ll2.next?.next?.next?.next = ListNode(4)
ll2.next?.next?.next?.next?.next = ListNode(5)
Solution().swapPairs(ll2)
