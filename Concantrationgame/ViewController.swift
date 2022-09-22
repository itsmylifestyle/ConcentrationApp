//
//  ViewController.swift
//  Concantrationgame
//
//  Created by Айбек on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches) "
        }
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.black
        } else {
            button.setTitle(emoji, for: .normal )
            button.backgroundColor = UIColor.white
        }
    }
    
    let emojiCollection = ["🐰", "🐼", "🐰", "🐼"]
    
    @IBOutlet var buttonColl: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonColl.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

