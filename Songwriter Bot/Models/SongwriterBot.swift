//
//  SongwriterBot.swift
//  Songwriter Bot
//
//  Created by Bassist Zero on 5/23/21.
//

import Foundation
import AVFoundation

class SongwriterBot {
    private var ml = MusicML(tempo: 120)
    private var tempo: Int
    private var notes: [String]
    
    private let noteToSound: [String:String] =
        ["0":"0.mp3",
         "1":"1.mp3",
         "2":"2.mp3",
         "3":"3.mp3",
         "4":"4.mp3",
         "5":"5.mp3",
         "6":"6.mp3",
         "7":"7.mp3",
         "8":"8.mp3",
         "9":"9.mp3",
         "10":"10.mp3",
         "11":"11.mp3",
         "12":"12.mp3",
         "13":"13.mp3",
        ]
    
    init(tempo: Int) {
        self.tempo = 120
        self.notes = []
    }
    
    /// Generate notes for an 8 note riff.
    public func generateEightNoteRiff() {
        notes = ml.generateNotes()
    }
    
    /// Return formatted tab text.
    public func getTab() -> String {
        return "E: \(notes[0])-\(notes[1])-\(notes[2])-\(notes[3])-\(notes[4])-\(notes[5])-\(notes[6])-\(notes[7])"
    }
    
    /// Play guitar sound in loop
    public func parseGuitar() {
        // To-do: sound looping
        
        for index in 0...notes.count - 1 {
            let note = notes[index]
            
            if let sound = noteToSound[note] {
                playSound(sound)
            }
        }
        
    }
    
    private func playSound(_ name: String) {
        if let path = Bundle.main.url(forResource: name, withExtension: "mp3") {
            let audioPlayer = AVPlayer(url: path)
            audioPlayer.play()
        }
    }
}
