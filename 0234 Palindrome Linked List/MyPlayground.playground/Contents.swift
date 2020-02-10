/**
 *Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 Example 2:

 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 *
 *
 * Definition for singly-linked list.
 *
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
    var arr: [Int] = []
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head?.next != nil else { return true }
        
        var newHead = head
        while newHead != nil {
            arr.insert(newHead!.val, at: 0)
            newHead = newHead?.next
        }
        
        var compareHead = head
        for val in arr {
            if val != compareHead!.val {
                break
            }
            compareHead = compareHead?.next
        }
        
        return compareHead?.next == nil
    }
}

let ll1 = ListNode(1)
ll1.next = ListNode(2)
ll1.next?.next = ListNode(2)
ll1.next?.next?.next = ListNode(1)
print(Solution().isPalindrome(ll1))

let ll2 = ListNode(0)
ll2.next = ListNode(1)
ll2.next?.next = ListNode(2)
ll2.next?.next?.next = ListNode(3)
print(Solution().isPalindrome(ll2))

let ll3 = ListNode(1)
ll3.next = ListNode(2)
ll3.next?.next = ListNode(3)
ll3.next?.next?.next = ListNode(2)
ll3.next?.next?.next?.next = ListNode(1)
print(Solution().isPalindrome(ll3))

let ll4 = ListNode(1)
ll4.next = ListNode(2)
print(Solution().isPalindrome(ll4))
