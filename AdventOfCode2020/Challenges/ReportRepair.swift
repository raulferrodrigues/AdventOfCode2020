//
//  ReportRepair.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 02/12/20.
//

import Foundation

class ReportRepair {
    static let input: [Int] = []
    
    static let sum = 2020
    
    static func partOne() -> Int {
        let over = input.filter { $0 > sum / 2 }
        let under = input.filter { $0 <= sum / 2 }
        
        for o in over {
            for u in under {
                if o + u == sum {
                    return o * u
                }
            }
        }
        
        return 0
    }
    
    static func partTwo() -> Int {
        class Toggle {
            let number: Int
            var active: Bool
            
            init(number: Int) {
                self.number = number
                self.active = false
            }
        }
        
        let min = input.min() ?? 0
        
        var toggles: [Toggle] = []
        
        input.sorted().forEach { n in
            toggles.append(Toggle(number: n))
        }
        
        for first in toggles {
            first.active.toggle()
            for second in toggles {
                second.active.toggle()
                if sum - (first.number + second.number) >= min {
                    for third in toggles {
                        third.active.toggle()
                        if first.number + second.number + third.number == sum {
                            return first.number * second.number * third.number
                        }
                        third.active.toggle()
                    }
                }
                second.active.toggle()
            }
            first.active.toggle()
        }
        
        return 0
    }
    
    static func partRaul() -> (Int, Int, Int) {
        let answer = [8959, 21501, 24072]
        
        let input: [Int] = { () -> [Int] in
            var aux: [Int] = []
            for _ in 1 ... 50000 {
                aux.append(Int.random(in: 1 ... 50000))
            }
            return aux
        }()
        
        let sum = answer.reduce(0) { (sum, n) in
            sum + n
        }
        
        
        
        class Toggle {
            let number: Int
            var active: Bool
            
            init(number: Int) {
                self.number = number
                self.active = false
            }
        }
        
        let min = input.min() ?? 0
        
        var toggles: [Toggle] = []
        
        input.sorted().forEach { n in
            toggles.append(Toggle(number: n))
        }
        
        for first in toggles {
            first.active.toggle()
            for second in toggles {
                second.active.toggle()
                if sum - (first.number + second.number) >= min {
                    for third in toggles {
                        third.active.toggle()
                        if first.number + second.number + third.number == sum {
                            return (first.number, second.number, third.number)
                        }
                        third.active.toggle()
                    }
                }
                second.active.toggle()
            }
            first.active.toggle()
        }
        
        return (0, 0, 0)
    }
}


