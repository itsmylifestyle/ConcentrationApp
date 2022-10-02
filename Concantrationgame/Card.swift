//
//  Card.swift
//  Concantrationgame
//
//  Created by Khandevy on 25.09.2022.
//

import Foundation//Views


struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier : Int;
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
