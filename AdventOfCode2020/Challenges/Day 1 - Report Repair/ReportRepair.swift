//
//  ReportRepair.swift
//  AdventOfCode2020
//
//  Created by Raul Rodrigues on 02/12/20.
//

import Foundation

class ReportRepair {
    static let input = [1789, 1818, 1729, 1578, 1927, 751, 1772, 1521, 1850, 1438, 1855, 1334, 1878, 1290, 1678, 1847, 1495, 1538, 1403, 1797, 1906, 1770, 1963, 1370, 1684, 1328, 1544, 1528, 1871, 2010, 1999, 1347, 1760, 1903, 1860, 1468, 1511, 1477, 1668, 1979, 1358, 1298, 1493, 1459, 1382, 2001, 1394, 1681, 1515, 1948, 1991, 1775, 1661, 1786, 1966, 1506, 1853, 1373, 1454, 1462, 1830, 1964, 1442, 1455, 2008, 1854, 1763, 1758, 1751, 1460, 1630, 1487, 1360, 1793, 1590, 1940, 1388, 1313, 1408, 1429, 1725, 1397, 1941, 1974, 1788, 1473, 1913, 664, 1989, 1490, 1778, 1726, 1366, 2005, 1449, 1924, 1926, 1769, 1314, 1636, 1780, 1546, 1647, 185, 320, 396, 1595, 1867, 1602, 1699, 1367, 1876, 1662, 1686, 1581, 1697, 1938, 1400, 720, 1808, 1625, 1439, 1734, 2003, 1718, 1879, 1864, 1811, 1309, 721, 1607, 1814, 1484, 1869, 1736, 1507, 1437, 1894, 1561, 2004, 269, 1942, 1915, 1767, 1562, 1364, 1783, 1863, 1601, 1323, 182, 1985, 1722, 1545, 1774, 1552, 1742, 1790, 1874, 1583, 1308, 1441, 1463, 1503, 1447, 1540, 1953, 1371, 1331, 1688, 1905, 1815, 1799, 811, 1446, 1374, 1936, 1665, 1433, 1551, 1806, 1674, 1784, 1596, 1704, 1393, 1691, 1567, 1335, 593, 1509, 1986, 1297, 1419, 1418, 1339, 1745, 1930, 1514, 1706]
    
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


