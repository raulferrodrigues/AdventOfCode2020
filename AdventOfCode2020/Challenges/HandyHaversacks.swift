//
//  HandyHaversacks.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 07/12/20.
//

import Foundation

struct HandyHaversacks {
    let input: [String]
    
    init() {
        guard let input = Reader.getInput(day: 7) else { fatalError() }
        
        self.input = input
            .split(separator: "\n")
            .map { String($0) }
    }
    
    func partOne() -> Int {
        let bag = "shiny gold"
        let ruleBook = rulesParser(input: input)
        var cache: [String : Set<String>] = [:]
        
        return ruleBook
            .map { processColor(color: $0.key, ruleBook: ruleBook, cache: &cache) }
            .filter { $0.contains(bag) }
            .count
    }
    
    func partTwo() -> Int {
        let bag = "shiny gold"
        let ruleBook = rulesParser(input: input)
        var cache: [String : Int] = [:]
        
        
        
        return processQuantity(color: bag, ruleBook: ruleBook, cache: &cache)
    }
    
    private func processColor(color: String, ruleBook: [String : [String : Int]], cache: inout [String : Set<String>]) -> Set<String> {
        if ruleBook[color] == [:] { return [] }
        if let cached = cache[color] { return cached }
        guard let contents = ruleBook[color] else { fatalError() }
        
        var mergedSet: Set<String> = []
        for (subColor, quantity) in contents {
            let colorSet = processColor(color: subColor, ruleBook: ruleBook, cache: &cache)
            cache[subColor] = colorSet
            mergedSet = mergedSet.union(colorSet).union([subColor])
        }
        
        return mergedSet
    }
    
    private func processQuantity(color: String, ruleBook: [String : [String : Int]], cache: inout [String : Int]) -> Int {
        if ruleBook[color] == [:] { return 0 }
        if let cached = cache[color] { return cached }
        guard let contents = ruleBook[color] else { fatalError() }
        
        var colorCounter = 0
        for (subColor, quantity) in contents {
            let subColorCounter = processQuantity(color: subColor, ruleBook: ruleBook, cache: &cache)
            cache[subColor] = subColorCounter
            colorCounter = colorCounter + (quantity * (subColorCounter + 1))
        }
        
        return colorCounter
    }
    
    private func rulesParser(input: [String]) -> [String : [String : Int]] {
        var ruleBook: [String : [String : Int]] = [:]
        
        for rule in input {
            let ruleSplit = rule.split(separator: " ")
            let holder = "\(ruleSplit[0]) \(ruleSplit[1])"
            ruleBook[holder] = parseContents(rule: rule)
        }
        
        return ruleBook
    }
    
    private func parseContents(rule: String) -> [String : Int] {
        let contents = rule.drop { !$0.isNumber }
        if contents.count == 0 { return [:] }
        
        var res: [String : Int] = [:]
        contents
            .split(separator: ",")
            .forEach { part in
                let pieces = part.split(separator: " ")
                res["\(pieces[1]) \(pieces[2])"] = Int(pieces[0])
            }
        
        return res
    }
}
