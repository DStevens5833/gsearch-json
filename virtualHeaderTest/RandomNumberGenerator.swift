//
//  rng.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}