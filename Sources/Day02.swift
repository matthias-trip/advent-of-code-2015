import Algorithms

struct Day02: AdventDay {
    
    struct Present {
        let sides: [Int]
        
        let length: Int
        let height: Int
        let breadth: Int
        
        init(from line: String) {
            let components = line.components(separatedBy: "x")
            self.length = Int(components[0])!
            self.height = Int(components[1])!
            self.breadth = Int(components[2])!
            
            self.sides = components.map { Int($0)! }.sorted()
        }
        
        var squareFeet: Int {
            return 2 * ((length * breadth) + (length * height) + (breadth * height))
        }
        
        var smallestSide: Int {
            return [
                (length * breadth),
                (length * height),
                (breadth * height)
            ].min()!
        }
        
        var ribbon: Int {
            let sides = self.sides
            return sides[0] + sides[0] + sides[1] + sides[1] + (sides[0] * sides[1] * sides[2])
        }
    }
    
    var data: String
    
    func part1() async throws -> Any {
        return self.data.components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map { Present(from: $0) }
            .reduce(0) { partialResult, present in
                return partialResult + present.squareFeet + present.smallestSide
            }
    }
    
    func part2() async throws -> Any {
        return self.data.components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map { Present(from: $0) }
            .reduce(0) { partialResult, present in
                return partialResult + present.ribbon
            }
    }
}
