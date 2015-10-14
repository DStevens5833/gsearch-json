//
//  Person.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

//struct Person {
//    var firstName: String
//    var middleInitial: Character?
//    var lastName: String
//    
//    init() {
//        firstName = "John"
//        lastName = "Doe"
//    }
//    
//    init(firstName: String, middleInitial: Character? = " ", lastName: String) {
//        self.firstName = firstName
//        
//        if middleInitial != " " {
//            self.middleInitial = middleInitial
//        }
//        
//        self.lastName = lastName
//    }
//    
//    var name: String {
//        get {
//            if middleInitial != nil {
//                return firstName + " " + String(middleInitial!) + " " + lastName
//            } else {
//                return firstName + " " + lastName
//            }
//        }
//    }
//}
//
//extension Person {
//    func sayHello() -> String {
//        return "\(name) says hello!"
//    }
//}