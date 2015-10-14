//
//  DiceGameProtocol.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

protocol DiceGame {
    var dice: Dice { get }
    func play()
}