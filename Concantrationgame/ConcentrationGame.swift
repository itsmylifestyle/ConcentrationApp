//
//  ConcentrationGame.swift
//  Concantrationgame
//
//  Created by khandevy on 25.09.2022.
//

import Foundation //Model

class ConcentrationGame {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndIfOnlyFacedUp : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index : Int) { //Whole logic of game
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndIfOnlyFacedUp, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else { 
                indexOfOneAndIfOnlyFacedUp = index
            }
        }
    }
    
    init(NumberOfPairedCards : Int) {
        assert(NumberOfPairedCards > 0, "ConcentrationGame.init(\(NumberOfPairedCards): must have at least one pair of cards")
        for _ in 1...NumberOfPairedCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
