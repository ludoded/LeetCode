/**
 Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.

 In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level.

 Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.

  

 Example 1:

 Input: "/home/"
 Output: "/home"
 Explanation: Note that there is no trailing slash after the last directory name.
 Example 2:

 Input: "/../"
 Output: "/"
 Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
 Example 3:

 Input: "/home//foo/"
 Output: "/home/foo"
 Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
 Example 4:

 Input: "/a/./b/../../c/"
 Output: "/c"
 Example 5:

 Input: "/a/../../b/../c//.//"
 Output: "/c"
 Example 6:

 Input: "/a//b////c/d//././/.."
 Output: "/a/b/c"
 */

class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack: [String] = []
        var currDir: String = ""
        let path = Array(path)
        let count = path.count
        
        for i in 0..<count {
            if path[i] == "/" || i == count - 1 {
                if path[i] != "/" {
                    currDir.append(path[i])
                }
                if currDir.isEmpty || currDir == "." {
                    currDir = ""
                    continue
                } else if currDir == ".." {
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                } else {
                    stack.append(currDir)
                }
                currDir = ""
            } else if path[i] == " " {
                continue
            } else {
                currDir.append(path[i])
            }
        }
        
        if stack.isEmpty { return "/" }
        
        var result: String = ""
        for dir in stack {
            result.append("/")
            result.append(dir)
        }
        
        return result
    }
}

print(Solution().simplifyPath("/home/")) // "/home"
print(Solution().simplifyPath("/../")) // "/"
print(Solution().simplifyPath("/...")) // "/..."
print(Solution().simplifyPath("/home//foo/")) // "/home/foo"
print(Solution().simplifyPath("/a/./b/../../c/")) // "/c"
print(Solution().simplifyPath("/a/../../b/../c//.//")) // "/c"
print(Solution().simplifyPath("/a//b////c/d//././/..")) // "/a/b/c"
