import Algorithms
import Foundation

struct Day03: AdventDay {
    
    enum Instruction: String {
        case north = "^"
        case south = "v"
        case east = ">"
        case west = "<"
    }
    
    struct House: Hashable {
        var x: Int
        var y: Int
    }
    
    var data: String
    var instructions: [Instruction]
    
    init(data: String) {
        self.data = data
        self.instructions = self.data.compactMap { Instruction(rawValue: String($0)) }
    }
    
    func part1() async throws -> Any {
        let numberOfSantas = 1
        return self.housesVisited(by: numberOfSantas)
    }
    
    func part2() async throws -> Any {
        let numberOfSantas = 2
        return self.housesVisited(by: numberOfSantas)
    }

    private func housesVisited(by numberOfSantas: Int = 1) -> Int {
        var currentHouseBySanta: [Int: House] = [:]
        for santa in 0...numberOfSantas {
            currentHouseBySanta[santa] = House(x: 0, y: 0)
        }

        var housesVisited = Set<House>()
        housesVisited.insert(House(x: 0, y: 0)) // Always visit house 0,0
        
        var santa = 0
        for instruction in instructions {
            switch instruction {
            case .north:
                currentHouseBySanta[santa]!.y += 1
            case .east:
                currentHouseBySanta[santa]!.x += 1
            case .south:
                currentHouseBySanta[santa]!.y -= 1
            case .west:
                currentHouseBySanta[santa]!.x -= 1
            }
            
            housesVisited.insert(currentHouseBySanta[santa]!)
            santa = (santa + 1) % numberOfSantas
        }

        return housesVisited.count
    }
}
