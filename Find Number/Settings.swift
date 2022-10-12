//
//  Settings.swift
//  Find Number
//
//  Created by АБЗАЛ АБЗАЛ on 07.10.2022.
//

import Foundation

enum KeysUserDefaults {
    static let settingsGame = "settingsGame"
    static let recordGame = "settingsGame"
}

struct SettingsGame:Codable {
    var timerState:Bool
    var timeForGame:Int
}

class Settings {
    static var shared = Settings()
    
    private let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    
    var currentSettings:SettingsGame {
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data {
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultSettings) {
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
                }
                return defaultSettings
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
        }
    }
    
    func resetSettings() {
        currentSettings = defaultSettings
    }
}
