/**
 Validate if a given string can be interpreted as a decimal number.

 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 " -90e3   " => true
 " 1e" => false
 "e3" => false
 " 6e-1" => true
 " 99e2.5 " => false
 "53.5e93" => true
 " --6 " => false
 "-+3" => false
 "95a54e53" => false

 Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one. However, here is a list of characters that can be in a valid decimal number:

 Numbers 0-9
 Exponent - "e"
 Positive/negative sign - "+"/"-"
 Decimal point - "."
 Of course, the context of these characters also matters in the input.

 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button to reset your code definition.


 */

import Foundation

class Solution {
    func isNumber(_ s: String) -> Bool {
        let trimmed = s.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regex = try! NSRegularExpression(pattern: "\\s*[+-]?((\\d+)((\\.)\\d*)?|((\\.)\\d+))((e)[-+]?\\d+)?\\s*", options: [.caseInsensitive])
        let results = regex.matches(in: trimmed,
                                    range: NSRange(s.startIndex..., in: trimmed))
        return results.contains(where: { $0.range.length == trimmed.count })
    }
}

print(Solution().isNumber("0")) // true
print(Solution().isNumber("01")) // true
print(Solution().isNumber("3.")) // true
print(Solution().isNumber(" 0.1"))// true
print(Solution().isNumber("2e10"))//true
print(Solution().isNumber(" -90e2   "))//true
print(Solution().isNumber("6e-1"))//true
print(Solution().isNumber("53.5e95"))//true
print(Solution().isNumber(" .0 "))//true
print(Solution().isNumber(" +.0 "))//true
print(Solution().isNumber(" 005047e+6"))//true

print(Solution().isNumber(" "))//false
print(Solution().isNumber("."))//false
print(Solution().isNumber("abc"))//false
print(Solution().isNumber("1 a"))//false
print(Solution().isNumber(" --6 "))//false
print(Solution().isNumber("  99e2.5"))//false
print(Solution().isNumber(" 1e"))//false
print(Solution().isNumber("e3"))//false

