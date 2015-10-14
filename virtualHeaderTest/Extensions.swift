//
//  extensions.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

//extension Int {
//    func repetitions(task: () -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//    
//    mutating func square() {
//        self *= self
//    }
//    
//    subscript(var digitIndex: Int) -> Int {
//        var decimalBase = 1
//        while digitIndex > 0 {
//            decimalBase *= 10
//            --digitIndex
//        }
//        return (self / decimalBase) % 10
//    }
//    
//    enum Kind {
//        case Negative, Zero, Positive
//    }
//    
//    var kind: Kind {
//        switch self {
//        case 0:
//            return .Zero
//        case let x where x > 0:
//            return .Positive
//        default:
//            return .Negative
//        }
//    }
//}