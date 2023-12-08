import Foundation

class Utils {
    // From https://victorqi.gitbooks.io/swift-algorithm/content/greatest_common_divisor.html
    public static func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        if r != 0 {
            return Utils.greatestCommonDivisor(b, r)
        } else {
            return b
        }
    }
    
    // From https://victorqi.gitbooks.io/swift-algorithm/content/greatest_common_divisor.html
    public static func lowestCommonMultiple(_ m: Int, _ n: Int) -> Int {
        return m*n / Utils.greatestCommonDivisor(m, n)
    }
}
