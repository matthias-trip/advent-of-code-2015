import Algorithms
import Foundation
import CryptoKit

struct Day04: AdventDay {

    var data: String
    
    var secret: String {
        return data.components(separatedBy: "\n").first!
    }
    
    func part1() async throws -> Any {
        return self.findHashForSecret(self.secret, difficulty: 5)
    }
    
    func part2() async throws -> Any {
        return self.findHashForSecret(self.secret, difficulty: 6)
    }
    
    private func findHashForSecret(_ secret: String, difficulty: Int = 5) -> Int {
        let prefix = String(repeating: "0", count: difficulty)
        
        var number = 0
        while(true) {
            let inputString = "\(secret)\(number)"
            let hash = self.md5(inputString)
            
            if hash.starts(with: prefix) {
                return number
            }
            
            number += 1
        }
    }
    
    private func md5(_ string: String) -> String {
        let computed = Insecure.MD5.hash(data: string.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
