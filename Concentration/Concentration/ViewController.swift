//
//  ViewController.swift
//  Concentration
//
//  Created by Li Yu on 7/7/18.
//  Copyright © 2018 yuli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // property initializer run before self is avaliable
    // lazy can not have did set, no property observers with lazy var
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    private var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
        // no set meaning read only
    }
    
    // Instance Varibles = properties
    private(set) var flipCount = 0 {
        // Property Observer !!!
        didSet {
            flipCountLabel.text = "Flips :\(flipCount)"
        }
    }
    
    private static let emojiArray = ["🎃", "👻", "🐻", "🙃"]
    
    lazy var emojiChoicesForGame = ViewController.emojiArray;
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]! // Array<UIButton>!
    
    @IBOutlet private weak var newGameButton: UIButton!
    
    @IBAction private func touchNewGameButton(_ sender: UIButton) {
        flipCount = 0
        emojiChoicesForGame = ViewController.emojiArray
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
        
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("card number = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel();
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let card = game.cards[index]
            let button = cardButtons[index]
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.7277399302, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emoji=[Int:String]() // var emoji = Dictionary<Int,String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoicesForGame.count > 0 {
            emoji[card.identifier] = emojiChoicesForGame.remove(at: emojiChoicesForGame.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
        
    }
}
