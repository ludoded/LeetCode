/**
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 Example:

 Input:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 */

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        var first: ListNode? = minVal(&lists)
        var node: ListNode? = first
        
        while node != nil {
            node?.next = minVal(&lists)
            node = node?.next
        }
        
        return first
    }
    
    private func minVal(_ list: inout [ListNode?]) -> ListNode? {
        var id: Int = 0
        var node: ListNode? = nil
        
        for i in 0..<list.count {
            if list[i] != nil {
                if list[i]!.val < (node?.val ?? Int.max) {
                    id = i
                    node = list[i]
                }
            }
        }
        
        if node?.next != nil {
            list[id] = node?.next
        } else if node != nil {
            list.remove(at: id)
        }
        
        return node
    }
}

/**
 NOTE: this is slow but it's correct. Its Runtime: 4712 ms, faster than 5.23% of Swift online submissions for Merge k Sorted Lists.
 Its time complexity is O(N * k)
 
 If we merge first each two list in lists array, as in Divide and Conquer => O(N * log k)
 Try this later
 */
