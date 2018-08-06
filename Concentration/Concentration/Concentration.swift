//
//  Concentration.swift
//  Concentration
//
//  Created by Li Yu on 7/7/18.
//  Copyright © 2018 yuli. All rights reserved.
//

import Foundation

struct Concentration
{
//    var cards = Array<Card>()
    private(set) var cards = [Card]() // assume writable
    
    private static func random(_ n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if (foundIndex == nil) {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set { // default to newValue
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init (numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration: init(numberOfPairsOfCards: \(numberOfPairsOfCards): numberOfPairsOfCards must be larger than 0")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
//            cards.append(card) // copy
//            cards.append(card) // copy
            cards += [card, card] // copy copy
        }
        // Suffle the Cards
//        for i in 0...cards.count-1 {
//            let j = i + Concentration.random(cards.count - i)
//            (cards[i], cards[j]) = (cards[j], cards[i])
//        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration: chooseCard(at \(index)): chose index isn't in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no card or 2 cards facing up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
