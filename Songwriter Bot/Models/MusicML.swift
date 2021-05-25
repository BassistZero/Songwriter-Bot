//
//  MusicML.swift
//  Songwriter Bot
//
//  Created by Bassist Zero on 5/25/21.
//

import Foundation

// Manual Machine Learing :D
class MusicML {
    private var note1: String
    private var note2: String
    private var note3: String
    private var note4: String
    private var note5: String
    private var note6: String
    private var note7: String
    private var note8: String
    
    private var tempo: Int
    
    private let minor = ["0", "2", "3", "5", "7", "8", "10", "11", "12"]
    private let metal = ["0", "1", "6", "13" ]
    
    init(tempo: Int) {
        self.note1 = "0"
        self.note2 = "0"
        self.note3 = "0"
        self.note4 = "0"
        self.note5 = "0"
        self.note6 = "0"
        self.note7 = "0"
        self.note8 = "0"
        self.tempo = tempo
    }
    
    public func setTempo(_ tempo: Int) {
        self.tempo = tempo
    }
    
    public func generateNotes() -> [String] {
        doAlternative()
        
        let notes = [note1, note2, note3, note4, note5, note6, note7, note8]
        return notes
    }
    
    private func doAlternative() {
        
    }
}
