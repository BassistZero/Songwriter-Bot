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
    private var guitarAudioPlayerEven: AVAudioPlayer!
    private var guitarAudioPlayerOdd: AVAudioPlayer!
    private var drumKickAudioPlayer: AVAudioPlayer!
    private var drumHiHatAudioPlayer: AVAudioPlayer!
    private var drumSnareAudioPlayer: AVAudioPlayer!
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
        notes = ml.generateAlternativeNotes()
//        notes = ml.generateMetalNotes()
        counter = 0
    }
    
//    /// Return formatted alternative tab text.
//    public func getTab() -> String {
//        return "E: \(notes[0])-\(notes[1])-\(notes[2])-\(notes[3])-\(notes[4])-\(notes[5])-\(notes[6])-\(notes[7])"
//    }
    
    /// Return formatted metal tab text.
    public func getTab() -> String {
        return "E: \(notes[0])-\(notes[1])-\(notes[2])-\(notes[3])-\(notes[4])-\(notes[5])-\(notes[6])-\(notes[7])-\(notes[8])-\(notes[9])-\(notes[10])-\(notes[11])-\(notes[12])-\(notes[13])-\(notes[14])-\(notes[15])"
    }
    
    /// Play Music in loop.
    public func playMusic() {
        timer = setTimer()
    }
    
    public func getCounter() -> Int {
        return counter
    }
    
    public func stopAndPlaySound() {
        if counter == 0 {
            counter = 1
            
            guitarAudioPlayerOdd = nil
            guitarAudioPlayerEven = nil
            drumHiHatAudioPlayer = nil
            drumSnareAudioPlayer = nil
            drumKickAudioPlayer = nil
            
            timer.invalidate()
            timer = nil
            
        } else {
            counter = 0
            note = 0
            if timer != nil {
                timer.invalidate()
            }
            timer = nil
            
            timer = setTimer()
        }
    }
    
    private func playDrumKickSound() {
        if let path = Bundle.main.path(forResource: "kick", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                drumKickAudioPlayer = try AVAudioPlayer(contentsOf: url)
                drumKickAudioPlayer.play()
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func playDrumSnareSound() {
        if let path = Bundle.main.path(forResource: "snare", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                drumSnareAudioPlayer = try AVAudioPlayer(contentsOf: url)
                drumSnareAudioPlayer.play()
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func playDrumHiHatSound() {
        if let path = Bundle.main.path(forResource: "hi-hat", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                drumHiHatAudioPlayer = try AVAudioPlayer(contentsOf: url)
                drumHiHatAudioPlayer.play()
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func playSoundEven(_ name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                guitarAudioPlayerEven = try AVAudioPlayer(contentsOf: url)
                guitarAudioPlayerEven.play()
                
                if guitarAudioPlayerOdd != nil {
                    guitarAudioPlayerOdd.stop()
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
                guitarAudioPlayerOdd = try AVAudioPlayer(contentsOf: url)
                guitarAudioPlayerOdd.play()
                
                if guitarAudioPlayerEven != nil {
                    guitarAudioPlayerEven.stop()
                }
            } catch {
                print("Here's a small error: \(error.localizedDescription)")
            }
        }
    }
    
    private func setTimer() -> Timer {
        return Timer.scheduledTimer(
            withTimeInterval: seconds,
            repeats: true,
            block: { _ in
                
                // Guitar notes playing
                if self.note % 2 == 0 {
                    self.playSoundOdd(String(self.notes[self.note]))
                } else {
                    self.playSoundEven(String(self.notes[self.note]))
                }
                    
                // Drums hard-coded playing
                if self.note == 0 || self.note == 8 {
                    self.playDrumKickSound()
                    self.playDrumHiHatSound()
                    
                } else if self.note == 1 || self.note == 9 {
                    
                } else if self.note == 2 || self.note == 10 {
                    self.playDrumHiHatSound()
                    self.playDrumSnareSound()
                    
                }  else if self.note == 3 || self.note == 11 {
                    
                } else if self.note == 4 {
                    self.playDrumHiHatSound()
                    
                } else if self.note == 12 {
                    self.playDrumHiHatSound()
                    self.playDrumKickSound()
                    
                } else if self.note == 5 || self.note == 13 {
                    self.playDrumKickSound()
                    
                } else if self.note == 6 || self.note == 14 {
                    self.playDrumHiHatSound()
                    self.playDrumSnareSound()
                    
                } else if self.note == 7 {
                    
                } else if self.note == 15 {
                    self.playDrumSnareSound()
                    
                }
                
                
                self.note += 1
                if self.note == 16 {
                    self.note = 0
                }
        })
    }
    
    private func stopSound() {
        guitarAudioPlayerOdd = nil
        guitarAudioPlayerEven = nil
        
        if timer != nil {
            timer.invalidate()
        }
    }
}
