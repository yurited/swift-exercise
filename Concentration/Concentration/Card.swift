//
//  Card.swift
//  Concentration
//
//  Created by Li Yu on 7/7/18.
//  Copyright © 2018 yuli. All rights reserved.
//

import Foundation

struct Card
{
    // diff
    // struct has no inheretance
    // struc is value type and class is reference type
    // value type copied when passed but has  copy on write semantics in swift
    //
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var uniqueIdentifierFactory = 0;
    
    static func getUniqueIndentifier() -> Int {
        uniqueIdentifierFactory += 1
        return uniqueIdentifierFactory;
        
    }
    
    init () {
        self.identifier = Card.getUniqueIndentifier()
    }
}
