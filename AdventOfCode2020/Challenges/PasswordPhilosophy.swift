//
//  PasswordPhilosophy.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 02/12/20.
//

import Foundation

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}

class PasswordPhilosophy {
    static func partOne() -> Int {
        let res = input.reduce(0) { sum, elem in
            var count = 0
            for char in elem.2 {
                if char == elem.1 {
                    count += 1
                }
            }
            
            if count <= elem.0.1 && count >= elem.0.0 {
                return sum + 1
            } else {
                return sum
            }
        }
        
        return res
    }
    
    static func partTwo() -> Int {
        let res = input.reduce(0) { sum, elem in
            let first: Bool = {
                let arr = Array(elem.2)
                let pos = elem.0.0
                return arr[pos - 1] == elem.1
            }()
            
            let second: Bool = {
                let arr = Array(elem.2)
                let pos = elem.0.1
                return arr[pos - 1] == elem.1
            }()
            
            if first ^ second {
                return sum + 1
            } else {
                return sum
            }
        }
        
        return res
    }
    
    private static let input: [((Int, Int), Character, String)] = []
}

