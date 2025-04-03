// File: Settings.swift
import SwiftData
import Foundation

@Model
class Settings {
    // model for app settings (e.g., theme preference)
    var isDarkMode: Bool
    var id: UUID

    init(isDarkMode: Bool) {
        self.isDarkMode = isDarkMode
        self.id = UUID()
    }
}
