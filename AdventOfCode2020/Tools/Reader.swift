//
//  Reader.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 04/12/20.
//

import Foundation

class Reader {
    static func getInput(day: Int) -> String? {
        let url = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)/AoC2020/day\(day)")
        return try? String(contentsOf: url!, encoding: .utf8)
    }
   
}
