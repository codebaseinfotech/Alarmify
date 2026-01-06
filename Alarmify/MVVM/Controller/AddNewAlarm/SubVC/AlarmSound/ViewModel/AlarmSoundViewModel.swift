//
//  AlarmSoundViewModel.swift
//  Alarmify
//
//  Created by Ankit on 06/01/26.
//

import Foundation
import AVFoundation

struct AlarmSound: Codable {
    let name: String
    let type: String
    let url: String
}

class AlarmSoundViewModel {
    
    var soundList: [AlarmSound] = [] {
        didSet {
            successGetSound?()
        }
    }
    var successGetSound: (()->Void)?
    var selectedIndex: Int? = 0
    var isPlaying = false
    
    // MARK: - Load AlarmSound Sounds
    func loadAlarmSounds() -> [AlarmSound] {
        
        guard let url = Bundle.main.url(forResource: "AlramSound", withExtension: "json") else {
            print("AlarmSound.json not found")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let sounds = try JSONDecoder().decode([AlarmSound].self, from: data)
            return sounds
        } catch {
            print("Error loading AlarmSound.json:", error)
            return []
        }
    }
    
}

class SoundPlayer {
    
    static let shared = SoundPlayer()
    private var player: AVAudioPlayer?

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing sound:", error)
        }
    }
    
    func stop() {
        player?.stop()
        player = nil
    }
    
    func isPlaying() -> Bool {
        return player?.isPlaying ?? false
    }
}
