//
//  TobogganTrajectory.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 03/12/20.
//

import Foundation

struct TobogganTrajectory {
    let horizontal: Int
    let vertical: Int
    
    func partOne() -> Int {
        guard let input = Reader.getInput(day: 3) else { fatalError() }
        let table = input.split(separator: "\n").map { $0.map { $0 == "#" } }
        
        var hits = 0
        var count = 0
        var position = 0
        while count < table.count {
            if checkHit(treeline: table[count], position: position) { hits += 1 }
            position += horizontal
            count += vertical
        }
        
        return hits
    }
    
    func partTwo(input: [(Int, Int)]) -> Int {
        input.reduce(1) { res, slope in
            TobogganTrajectory(horizontal: slope.0, vertical: slope.1).partOne() * res
        }
    }
    
    private func checkHit(treeline: [Bool], position: Int) -> Bool {
        let length = treeline.count
        if position < length {
            return treeline[position]
        } else {
            let quotient = position / length
            let rest = position - (length * quotient)
            return treeline[rest]
        }
    }
    
    
    
    
}
