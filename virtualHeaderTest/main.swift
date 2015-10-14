//
//  main.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

//var dustin = Person(firstName: "Dustin", lastName: "Stevens")
//print(dustin.name)

//var paige = Person(firstName: "Paige", middleInitial: "A", lastName: "Brogan")
//print(paige.name)

//print(dustin.sayHello())

//var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("Random dice roll is \(d6.roll())")
//}

//let tracker = DiceGameTracker()
//let game = SnakesAndLadders()
//game.delegate = tracker
//game.play()

/**
 * Objects to be converted to JSON must have the following properties:
 *  - Top level object is [NSArray] or [NSDictionary]
 *  - Object instances are of [NSString], [NSNumber], [NSArray], [NSDictionary], or [NSNull]
 *  - Dictionary keys are instances of [NSString]
 *  - Numbers are not NaN or infinity
 */

struct TimeStamp: CustomStringConvertible {
    var usec: Double
    
    var timeInterval: Double {
        return self.usec / 1000000.0
    }
    
    var date: String {
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeZone = NSTimeZone()
        
        return dateFormatter.stringFromDate(date)
    }
    
    var description: String {
        return date
    }
}

struct Query: CustomStringConvertible {
    var timeStamp: [TimeStamp]
    var queryText: String
    
    var description: String {
        var str = "\(queryText)\n"
        
        for stamp in timeStamp {
            str += "\t" + stamp.description + "\n"
        }
        
        return str
    }
}

struct Event {
    var query: [Query]
}

struct Search {
    var event: [Event]
}

func parseJSONAt(path path: String) -> Search {
    // Create NSURL of JSON file's path
    //let path = "/Users/ds/Desktop/swift/untitled folder/virtualHeaderTest/Searches/Searches"
    let fm = NSFileManager.defaultManager()
    let files = try! fm.contentsOfDirectoryAtPath(path)

    var search = Search(event: [])

    for filePath in files {
        if filePath.hasSuffix(".json") {
            let fileURL = NSURL(fileURLWithPath: path + "/" + filePath)

            // Create NSData of JSON file using NSURL
            let fileData: NSData? = NSData(contentsOfURL: fileURL)

            do {
                let jsonObject: NSDictionary = try NSJSONSerialization.JSONObjectWithData(fileData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                let eventArray = jsonObject["event"]!
                var event = Event(query: [])
                for var i = 0; i < eventArray.count; i++ {
                    let queryObject = eventArray[i].valueForKey("query")!
                    let queryText = queryObject["query_text"]!
                    let idArray = queryObject["id"]!
                    
                    var q = Query(timeStamp: [], queryText: String(queryText!))
                    for var j = 0; j < idArray!.count; j++ {
                        let id = idArray![j]!
                        let tsString = id["timestamp_usec"]!! as! String
                        let ts = TimeStamp(usec: Double(tsString)!)
                        q.timeStamp.append(ts)
                    }
                    
                    event.query.append(q)
                }
                
                search.event.append(event)
            } catch {
                print("error")
            }
        }
    }
    
    return search
}

extension SequenceType where Generator.Element: Hashable {
    func frequencies() -> [(Generator.Element,Int)] {
        var frequency: [Generator.Element:Int] = [:]
        for x in self {
            frequency[x] = (frequency[x] ?? 0) + 1
        }
        return frequency.sort { $0.1 > $1.1 }
    }
}

func printSearch(search: Search) {
    var a = [String]()
    for e in search.event {
        for q in e.query {
            //        print(q.description)
            //        print(q.queryText)
            a.append(q.queryText)
        }
    }
    
    for (name, count) in a.frequencies() {
        print("\(count) -> \(name)")
    }
}

var search = parseJSONAt(path: "/Users/ds/Desktop/swift/untitled folder/virtualHeaderTest/Searches/Searches")

printSearch(search)


//let fuckYou = a.sort()
//for var i = 0; i < fuckYou.count; i++ {
//    print("\(i): \(fuckYou[i])")
//}


//var frequency: [String : Int] = [:]
//for x in a {
//    frequency[x] = (frequency[x] ?? 0) + 1
//}



//class Person {
//    var firstName: String
//    var lastName: String
//    var fullName: String {
//        return firstName + " " + lastName
//    }
//    
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//}
//
//func printArr<T>(array array: [T], andType: String) {
//    print("\(andType) = \(array)")
//}

//var intArray = [19, 20, 1, 4, 18, 19, 13, 20, 14]
//printArr(array: intArray, andType: "Original")
//
////var filteredIntArray = intArray.filter(<#T##includeElement: (Self.Generator.Element) throws -> Bool##(Self.Generator.Element) throws -> Bool#>)
//var filteredArray = intArray.filter({ $0 > 10 })
//printArr(array: filteredArray, andType: "Filtered")
//
////var mappedIntArray   = intArray.map(<#T##transform: (Self.Generator.Element) throws -> T##(Self.Generator.Element) throws -> T#>)
//var mappedArray = intArray.map({ $0 * 3 })
//printArr(array: mappedArray, andType: "Mapped  ")
//
////var reducedIntArray  = intArray.reduce(<#T##initial: T##T#>, combine: <#T##(T, Self.Generator.Element) throws -> T#>)
//var reducedArray = intArray.reduce(0, combine: +)
//print("Reduced  = \(reducedArray)")

