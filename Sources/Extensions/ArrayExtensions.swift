import Foundation

extension Array {
    public func chunked(_ size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    public func group(by condition: (Element) -> Bool) -> [[Element]] {
        var tmp = [Element]()
        var result = [[Element]]()
        for element in self {
            if condition(element) {
                result.append(tmp)
                tmp.removeAll()
            } else {
                tmp.append(element)
            }
        }
        if !tmp.isEmpty {
            result.append(tmp)
        }
        return result
    }
}
