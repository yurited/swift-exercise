//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Li Yu on 8/4/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation

struct PlayingCard {
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        case spades = "spades"
        case heart = "heart"
        case clubs = "clubs"
        case diamond = "diamond"
        static var all: [Suit] { return [Suit.spades, .heart, .clubs, .diamond] }
    }
    
    enum Rank{
        case ace
        case numeric(Int)
        case face(String)
        
        var order: Int? {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face (let kind) where kind == "K": return 13
            default: return nil
            }
        }
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
}
