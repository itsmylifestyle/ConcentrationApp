//
//  ConcentrationGame.swift
//  Concantrationgame
//
//  Created by khandevy on 25.09.2022.
//

import Foundation //Model

class ConcentrationGame {
    var cards = [Card]()
    
    var indexOfOneAndIfOnlyFacedUp : Int?
    
    func chooseCard(at index : Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndIfOnlyFacedUp, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndIfOnlyFacedUp = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndIfOnlyFacedUp = index
            }
        }
    }
    
    init(NumberOfPairedCards : Int) {
        for _ in 1...NumberOfPairedCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
