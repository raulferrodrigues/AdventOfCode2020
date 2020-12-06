//
//  PassportProcessing.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 04/12/20.
//

import Foundation

struct PassportProcessing {
    func partOne() -> Int {
        let required: Set<String> = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
        let optionals: Set<String> = ["cid"]
        
        guard let input = Reader.getInput(day: 4) else { fatalError() }
        let rep = input.replacingOccurrences(of: "\n\n", with: "\u{1f171}")
        return rep
            .split(separator: "\u{1f171}", omittingEmptySubsequences: true)
            .map {
                required
                    .subtracting(
                        Set($0
                            .replacingOccurrences(of: "\n", with: " ")
                            .split(separator: " ")
                            .map {
                                String($0.dropLast($0.count - 3))
                            })
                    )
            }
            .filter {
                $0.count == 0
            }
            .count
    }
    
    func partTwo() -> Int {
        let required: Set<String> = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
        let optionals: Set<String> = ["cid"]

        guard let input = Reader.getInput(day: 4) else { fatalError() }
        let rep = input.replacingOccurrences(of: "\n\n", with: "\u{1f171}")
        
        
        print(rep
            .split(separator: "\u{1f171}", omittingEmptySubsequences: true)
            .map {
                Set($0
                    .replacingOccurrences(of: "\n", with: " ")
                    .split(separator: " ")
                    .map {
                        checkEntry(for: String($0))
                    })
            })
        
        return rep
            .split(separator: "\u{1f171}", omittingEmptySubsequences: true)
            .map {
                required
                    .subtracting(
                        Set($0
                            .replacingOccurrences(of: "\n", with: " ")
                            .split(separator: " ")
                            .map {
                                checkEntry(for: String($0))
                            })
                    )
            }
            .filter {
                $0.count == 0
            }
            .count
    }
    
    private func checkEntry(for entry: String) -> String {
        let pair = entry.split(separator: ":")
        switch pair[0] {
        case "byr":
            if pair[1].count != 4 { return "" }
            guard let value = Int(pair[1]) else { return "" }
            return (value >= 1920 && value <= 2002) ? "byr" : ""
        case "iyr":
            if pair[1].count != 4 { return "" }
            guard let value = Int(pair[1]) else { return "" }
            return (value >= 2010 && value <= 2020) ? "iyr" : ""
        case "eyr":
            if pair[1].count != 4 { return "" }
            guard let value = Int(pair[1]) else { return "" }
            return (value >= 2020 && value <= 2030) ? "eyr" : ""
        case "hgt":
            let number = pair[1].dropLast(2)
            guard let value = Int(number) else { return "" }
            let unit = pair[1].dropFirst(number.count)
            return ((unit == "cm" && value >= 150 && value <= 193) || (unit == "in" && value >= 59 && value <= 76)) ? "hgt" : ""
        case "hcl":
            if pair[1].first != "#" || pair[1].count != 7 { return "" }
            let hex = pair[1].dropFirst()
            return Int(hex, radix: 16) != nil ? "hcl" : ""
        case "ecl":
            return Set(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]).contains(pair[1]) ? "ecl" : ""
        case "pid":
            return pair[1].count == 9 && pair[1].reduce(true) { $0 && $1 >= "0" && $1 <= "9" } ? "pid": ""
        default:
            return ""
        }
    }
}
