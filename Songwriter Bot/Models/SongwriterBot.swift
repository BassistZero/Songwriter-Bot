//
//  SongwriterBot.swift
//  Songwriter Bot
//
//  Created by Bassist Zero on 5/23/21.
//

//TODO: Drum and Optional(Bass playing root note) hard-coded generator
//TODO: Tempo converter

import Foundation
import AVFoundation

class SongwriterBot {
    private var ml = MusicML(tempo: 120)
    private var tempo: Int
    private var notes: [String]
    private var audioPlayerEven: AVAudioPlayer!
    private var audioPlayerOdd: AVAudioPlayer!
    private var timer: Timer!
    @objc private let seconds = 0.2
    private var note = 0
    private var counter = 0
    
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
        timer = Timer.scheduledTimer(
            withTimeInterval: seconds,
            repeats: true,
            block: { _ in
            if self.note % 2 == 0 {
                self.playSoundOdd(String(self.notes[self.note]))
            } else {
                self.playSoundEven(String(self.notes[self.note]))
            }
            
            self.note += 1
            if self.note == 8 {
                self.note = 0
            }
        })
    }
    
    public func getCounter() -> Int {
        return counter
    }
    
    public func stopAndPlaySound() {
        if counter == 0 {
            counter = 1
            
            audioPlayerOdd = nil
            audioPlayerEven = nil
            
            timer.invalidate()
            timer = nil
            
        } else {
            counter = 0
            note = 0
            if timer != nil {
                timer.invalidate()
            }
            timer = nil
            
            timer = Timer.scheduledTimer(
                withTimeInterval: seconds,
                repeats: true,
                block: { _ in
                if self.note % 2 == 0 {
                    self.playSoundOdd(String(self.notes[self.note]))
                } else {
                    self.playSoundEven(String(self.notes[self.note]))
                }
                
                self.note += 1
                if self.note == 8 {
                    self.note = 0
                }
            })
        }
    }
    
    private func playSoundEven(_ name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayerEven = try AVAudioPlayer(contentsOf: url)
                audioPlayerEven.play()
                
                if audioPlayerOdd != nil {
                    audioPlayerOdd.stop()
                }
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func playSoundOdd(_ name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayerOdd = try AVAudioPlayer(contentsOf: url)
                audioPlayerOdd.play()
                
                if audioPlayerEven != nil {
                    audioPlayerEven.stop()
                }
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func stopSound() {
        audioPlayerOdd = nil
        audioPlayerEven = nil
        
        if timer != nil {
            timer.invalidate()
        }
    }
}
