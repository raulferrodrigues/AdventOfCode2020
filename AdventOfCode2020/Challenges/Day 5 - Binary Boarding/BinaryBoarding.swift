//
//  BinaryBoarding.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 05/12/20.
//

import Foundation

struct BinaryBoarding {
    let input: [String]
    
    init() {
        guard let reader = Reader.getInput(day: 5) else { fatalError() }
        input = reader.split(separator: "\n").map { String($0) }
    }
    
    func partOne() -> Int {
        let length = 128
        let width = 8
        
        return input
            .map { boardingPass -> Int in
                let row = Array(boardingPass)
                    .dropLast(3)
                    .reduce((position: 0, halving: length / 2)) { (control, command) in
                        (control.position + (command == "B" ? control.halving : 0), control.halving / 2)
                    }
                    .position
                
                let seat = Array(boardingPass)
                    .dropFirst(7)
                    .reduce((position: 0, halving: width / 2)) { (control, command) in
                        (control.position + (command == "R" ? control.halving : 0), control.halving / 2)
                    }
                    .position
                
                print("\(row), \(seat)")
                
                return (row * 8) + seat
            }
            .max() ?? 0
    }
    
    func partTwo() -> Int {
        let length = 128
        let width = 8
        
        let passList = input
            .map { boardingPass -> Int in
                let row = Array(boardingPass)
                    .dropLast(3)
                    .reduce((position: 0, halving: length / 2)) { (control, command) in
                        (control.position + (command == "B" ? control.halving : 0), control.halving / 2)
                    }
                    .position
                
                let seat = Array(boardingPass)
                    .dropFirst(7)
                    .reduce((position: 0, halving: width / 2)) { (control, command) in
                        (control.position + (command == "R" ? control.halving : 0), control.halving / 2)
                    }
                    .position
                
                return (row * 8) + seat
            }
            .sorted()
        
        print(passList)
        
        var last = passList.first!
        for pass in passList {
            if pass - last > 1 {
                return pass - 1
            }
            last = pass
        }
        
        return 0
    }
}
