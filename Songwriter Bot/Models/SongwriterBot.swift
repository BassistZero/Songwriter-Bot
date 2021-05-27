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
    private var audioPlayer: AVAudioPlayer!
    private var timer: Timer!
    @objc let seconds = 0.2
    var note = 0
    
    init(tempo: Int) {
        self.tempo = 120
        self.notes = []
    }
    
    /// Generate notes for an 8 note riff.
    public func generateEightNoteRiff() {
        stopSound()
//        notes = ml.generateAlternativeNotes()
        notes = ml.generateMetalNotes()
    }
    
    /// Return formatted tab text.
    public func getTab() -> String {
        return "E: \(notes[0])-\(notes[1])-\(notes[2])-\(notes[3])-\(notes[4])-\(notes[5])-\(notes[6])-\(notes[7])"
    }
    
    /// Play guitar sound in loop.
    public func parseGuitar() {
        timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: true, block: { _ in
            self.playNotes(note: self.note)
            
            self.note += 1
            if self.note == 8 {
                self.note = 0
            }
        })
        
        
    }
    
    private func playNotes(note: Int) {
        self.playSound(self.notes[note])
        print("plays \(note)")
    }
    
    private func playSound(_ name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.play()
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func stopSound() {
        
    }
}
