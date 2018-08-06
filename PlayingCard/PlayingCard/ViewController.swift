//
//  ViewController.swift
//  PlayingCard
//
//  Created by Li Yu on 8/4/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck: PlayingCardDeck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...10 {
            print(deck.draw()!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

