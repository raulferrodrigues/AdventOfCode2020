//
//  CustomCustoms.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 06/12/20.
//

import Foundation

struct CustomCustoms {
    let input: [String]
    
    init() {
        guard let input = Reader.getInput(day: 6) else { fatalError() }
        self.input = input
            .replacingOccurrences(of: "\n\n", with: "\u{1f171}")
            .split(separator: "\u{1f171}")
            .map { String($0) }
    }
    
    func partOne() -> Int {
        return input
            .map { $0.replacingOccurrences(of: "\n", with: "") }
            .map { Set($0) }
            .reduce(0) { $0 + $1.count }
    }
    
    func partTwo() -> Int {
        return input
            .map {
                $0
                    .split(separator: "\n")
                    .reduce(Set((97...122).map { Character(UnicodeScalar($0)) })) {
                        $0.intersection($1)
                    }
            }
            .reduce(0) { $0 + $1.count }
    }
}
