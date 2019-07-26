import UIKit

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        var set: Set<String> = ["()"]
        
        guard n > 1 else { return Array(set) }
        
        for _ in 2...n where n > 1 {
            let initialGeneratedString = "()"
            
            var interSet: Set<String> = []
            for formedString in set {
                for j in 0..<formedString.count {
                    var newFormedString = formedString
                    newFormedString.insert(contentsOf: initialGeneratedString, at: formedString.index(formedString.startIndex, offsetBy: j))
                    interSet.insert(newFormedString)
                }
            }
            set = interSet
        }
        
        return Array(set)
    }
}

print(Solution().generateParenthesis(5))
