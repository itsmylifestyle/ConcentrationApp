//
//  Card.swift
//  Concantrationgame
//
//  Created by Khandevy on 25.09.2022.
//

import Foundation//Views


struct Card : Hashable {
    
    func hash(into hasher : inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs : Card, rhs : Card) -> Bool {
        return  lhs.identifier == rhs.identifier
    }
    
    var isFacedUp = false
    var isMatched = false
    private var identifier : Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
