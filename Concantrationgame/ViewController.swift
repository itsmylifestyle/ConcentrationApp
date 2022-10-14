//
//  ViewController.swift
//  Concantrationgame
//
//  Created by khandevy on 22.09.2022.
//

import UIKit //Controller

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(NumberOfPairedCards: NumberOfPairedCards)
    
    var NumberOfPairedCards : Int {
        return (buttonColl.count + 1) / 2
    }
    
    private func updateTouches() {
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.red
        ]
        let attriburedString = NSAttributedString (string: "Touches: \(touches) ", attributes: attributes)
        
        touchLabel.attributedText = attriburedString
    }
     
    private(set) var touches = 0 {
        didSet {
             updateTouches()
        }
    }
    
//______________________________________________________________________________________
//                                                                                      |
//   func flipButton(emoji: String, button: UIButton) {                                 |
//        if button.currentTitle == emoji {                                             |
//            button.setTitle("", for: .normal)                                         |
//            button.backgroundColor = UIColor.black                                    |
//        } else {                                                                      |Description: this is a logic to flip the card
//            button.setTitle(emoji, for: .normal )                                     |
//            button.backgroundColor = UIColor.white                                    |
//        }                                                                             |
//    }                                                                                 |
//______________________________________________________________________________________|
    
//___________________________________________
//    let emojiCollection: [String] = [     |
//        UIImage(named: "logo1")!,         |
//        UIImage(named: "logo2")!,         |
//        UIImage(named: "logo3")!,         |
//        UIImage(named: "logo4")!,         |
//        UIImage(named: "logo5")!          |
//    ]                                     |
//__________________________________________|
   // private var emojiCollection = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]
    private var emojiCollection = "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨"
    
    private var emojiDictionary = [Card : String]()
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil { 
            let randomStringIndex = emojiCollection.index(emojiCollection.startIndex, offsetBy: emojiCollection.count.arc4randomExtension)
            emojiDictionary[card] = String(emojiCollection.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonColl.indices {
            let button = buttonColl[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal )
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.white : UIColor.black
            }
        }
    }
    
    
    @IBOutlet private var buttonColl: [UIButton]!
    @IBOutlet private weak var touchLabel: UILabel! {
        didSet {
            updateTouches()
        }
    }
    @IBAction private  func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonColl.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}


extension Int {//It will never lead to  emergency shutdown
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
