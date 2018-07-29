//
//  Concentration.swift
//  Concentration
//
//  Created by Li Yu on 7/7/18.
//  Copyright © 2018 yuli. All rights reserved.
//

import Foundation

class Concentration
{
//    var cards = Array<Card>()
    var cards = [Card]()
    static func random(_ n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    init (numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
//            cards.append(card) // copy
//            cards.append(card) // copy
            cards += [card, card] // copy copy
        }
        // Suffle the Cards
        for i in 0...cards.count-1 {
            let j = i + Concentration.random(cards.count - i)
            (cards[i], cards[j]) = (cards[j], cards[i])
        }
    }
    
    func chooseCard (at index: Int) {
        
    }
}
