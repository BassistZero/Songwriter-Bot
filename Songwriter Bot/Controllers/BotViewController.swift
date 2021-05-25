//
//  BotViewController.swift
//  Songwriter Bot
//
//  Created by Bassist Zero on 5/22/21.
//

import UIKit

class BotViewController: UIViewController {
    
    @IBOutlet weak var tabDebugLabel: UILabel!
    
    var bot = SongwriterBot(tempo: 100) // 100 or 120. Something is easier to count. Should be ;)

    @IBAction func generateButton(_ sender: UIButton) {
        // generate riff
        bot.generateEightNoteRiff()
        
        // set up the tab
        tabDebugLabel.text = bot.getTab()
        
        // play the guitar
        bot.parseGuitar()
    }
    
}

