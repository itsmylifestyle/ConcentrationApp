//
//  ConcentrationGame.swift
//  Concantrationgame
//
//  Created by khandevy on 25.09.2022.
//

import Foundation //Model

struct ConcentrationGame {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndIfOnlyFacedUp : Int? {
        get {
            return cards.indices.filter() { cards[$0].isFacedUp }.oneAndOnly
//            return faceUpcArdIndices.count == 1 ? faceUpcArdIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices{
//                if cards[index].isFacedUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
            
            //that means
            //no
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index : Int) { //Whole logic of game
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndIfOnlyFacedUp, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
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

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
