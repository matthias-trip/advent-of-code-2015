import Algorithms

struct Day01: AdventDay {
    
    var data: String
    
    func part1() async throws -> Any {
        return self.data.reduce(0) { partialResult, character in
            if character == "(" {
                return partialResult + 1
            }
            else if character == ")" {
                return partialResult - 1
            }
            
            return partialResult
        }
    }
    
    func part2() async throws -> Any {
        var index = 1
        var floor = 0
        for character in self.data {
            if character == "(" {
                floor += 1
            }
            else if character == ")" {
                floor -= 1
            }
            
            if(floor == -1) {
                return index
            }
            
            index += 1
        }
        
        return 0
    }
}
