//
//  MusicML.swift
//  Songwriter Bot
//
//  Created by Bassist Zero on 5/25/21.
//

//TODO: alternative riff generation

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
    private let metal = ["0", "1", "6", "7", "12", "13" ]
    
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
    
    public func generateAlternativeNotes() -> [String] {
        doAlternative()
        
        let notes = [note1, note2, note3, note4, note5, note6, note7, note8]
        return notes
    }
    
    public func generateMetalNotes() -> [String] {
        doMetal()
        
        let notes = [note1, note2, note3, note4, note5, note6, note7, note8]
        return notes
    }
    
    private func doAlternative() {
        note1 = generateNote1()
        note2 = generateNote2()
        note3 = generateNote3()
        note4 = generateNote4()
        note5 = generateNote5()
        note6 = generateNote6()
        note7 = generateNote7()
        note8 = generateNote8()
    }
    
    private func doMetal() {
        note1 = metal.randomElement()!
        note2 = metal.randomElement()!
        note3 = metal.randomElement()!
        note4 = metal.randomElement()!
        note5 = metal.randomElement()!
        note6 = metal.randomElement()!
        note7 = metal.randomElement()!
        note8 = metal.randomElement()!
    }
    
    private func generateNote1() -> String {
        ["0", "3", "5", "7", "11", "12"].randomElement()!
    }
    
    private func generateNote2() -> String {
        var note: String = "error"
        
        if note1 == "0" {
            note = ["0", "2", "12"].randomElement()!
            
        } else if note1 == "3" {
            note = ["0", "2", "7"].randomElement()!
            
        } else if note1 == "5" {
            note = ["2", "3", "7"].randomElement()!
            
        } else if note1 == "7" {
            note = ["0", "5", "8"].randomElement()!
            
        } else if note1 == "11" {
            note = ["0", "11", "12"].randomElement()!
            
        } else if note1 == "12" {
            note = ["0", "11", "12"].randomElement()!
        }
        
        return note
    }
    
    private func generateNote3() -> String {
        var note: String = "error"
        
        if note2 == "0" {
            note = ["0", "2", "12", "13"].randomElement()!
            
        } else if note2 == "2" {
            note = ["0", "2", "7"].randomElement()!
            
        } else if note2 == "3" {
            note = ["0", "2", "7"].randomElement()!
            
        } else if note2 == "5" {
            note = ["2", "3", "7"].randomElement()!
            
        } else if note2 == "7" {
            note = ["0", "5", "8"].randomElement()!
            
        } else if note2 == "8" {
            note = ["0", "2", "7"].randomElement()!
            
        } else if note2 == "11" {
            note = ["0", "11", "12"].randomElement()!
            
        } else if note2 == "12" {
            note = ["0", "11", "12"].randomElement()!
        }
        
        return note
    }
    
    private func generateNote4() -> String {
        var note: String = "error"
        
        if note3 == "0" {
            note = ["1", "2", "3", "5", "7", "8", "12", "13"].randomElement()!
            
        } else if note3 == "2" {
            note = ["3"].randomElement()!
            
        } else if note3 == "3" {
            note = ["0", "2", "5", "7"].randomElement()!
            
        } else if note3 == "5" {
            note = ["3", "7", "8"].randomElement()!
            
        } else if note3 == "7" {
            note = ["0", "3", "5", "8", "12"].randomElement()!
            
        } else if note3 == "8" {
            note = ["0", "7", "11"].randomElement()!
            
        } else if note3 == "11" {
            note = ["0", "8"].randomElement()!
            
        } else if note3 == "12" {
            note = ["0", "11", "12"].randomElement()!
        } else if note3 == "13" {
            note = ["0", "12"].randomElement()!
        }
        
        return note
    }
    
    private func generateNote5() -> String {
        var note: String = "error"
        
        if note4 == "0" {
            note = ["2", "3", "5", "7", "8", "11", "12"].randomElement()!
            
        } else if note3 == note4 {
            note = "0"
            
        } else if note4 == "0" && note2 == "11" {
            note = ["2", "3", "5", "7", "8", "12"].randomElement()!
            
        } else if note4 == "1" {
            note = "0"
            
        } else if note4 == "2" {
            note = ["0", "3", "5"].randomElement()!
            
        } else if note4 == "3" {
            note = ["0", "2", "5", "7", "8"].randomElement()!
            
        } else if note4 == "5" {
            note = ["0","2", "3", "7", "8"].randomElement()!
            
        } else if note4 == "7" {
            note = ["0", "5", "8", "12"].randomElement()!
            
        } else if note4 == "8" {
            note = ["0","5", "7", "11", "12"].randomElement()!
            
        } else if note4 == "11" {
            note = ["0", "8", "12"].randomElement()!
            
        } else if note4 == "12" {
            note = ["0", "11", "12"].randomElement()!
            
        } else if note4 == "13" {
            note = ["0", "12"].randomElement()!
            
        }
        
        return note
    }
    
    private func generateNote6() -> String {
        var note: String = "error"
        
        if note5 == "0" {
            note = ["7", "8", "11", "12", "13"].randomElement()!
            
        } else if note4 == "11" {
            note = "0"
            
        } else if note5 == "2" {
            note = ["0", "3", "5"].randomElement()!
            
        } else if note5 == "3" {
            note = ["0", "2", "5", "7", "8"].randomElement()!
            
        } else if note5 == "5" {
            note = ["0","2", "3", "7", "8"].randomElement()!
            
        } else if note5 == "7" {
            note = ["0", "5", "8", "12"].randomElement()!
            
        } else if note5 == "8" {
            note = ["0","5", "7", "11", "12"].randomElement()!
            
        } else if note5 == "11" {
            note = ["0", "8", "12"].randomElement()!
            
        } else if note4 == "12" && note5 == "12" {
            note = "0"
            
        } else if note5 == "12" {
            note = ["0", "11", "12"].randomElement()!
            
        }
        
        return note
    }
    
    private func generateNote7() -> String {
        var note: String = "error"
        
        if note6 == "0" {
            note = ["0", "7", "8",].randomElement()!
            
        } else if note6 == "2" {
            note = ["0", "3", "5"].randomElement()!
            
        } else if note6 == "3" {
            note = ["0", "2", "5", "7"].randomElement()!
            
        } else if note6 == "5" {
            note = ["0","2", "3", "7"].randomElement()!
            
        } else if note6 == "7" {
            note = ["5", "8", "12"].randomElement()!
            
        } else if note6 == "8" {
            note = ["0","5", "7", "11", "12"].randomElement()!
            
        } else if note6 == "11" {
            note = ["0", "8", "12"].randomElement()!
            
        } else if note6 == "12" {
            note = ["0", "11", "12"].randomElement()!
            
        } else if note6 == "13" {
            note = ["0", "12"].randomElement()!
            
        }
        
        return note
    }
    
    private func generateNote8() -> String {
        var note: String = "error"
        
        if note7 == "0" {
            note = ["0", "7", "8", "12"].randomElement()!
            
        } else if note6 == note7 {
            note = "0"
            
        } else if note7 == "2" {
            note = ["0", "3", "5"].randomElement()!
            
        } else if note7 == "3" {
            note = ["0", "2", "5", "7"].randomElement()!
            
        } else if note7 == "5" {
            note = ["0","2", "3", "7"].randomElement()!
            
        } else if note7 == "7" {
            note = ["5", "8", "12"].randomElement()!
            
        } else if note7 == "8" {
            note = ["0","5", "7", "11", "12"].randomElement()!
            
        } else if note7 == "11" {
            note = ["0", "8", "12"].randomElement()!
            
        } else if note7 == "12" && (note1 == "0" || note1 == "12") {
            note = "11"
            
        } else if note7 == "12" {
            note = ["0", "12"].randomElement()!
            
        }
        
        return note
    }
}
