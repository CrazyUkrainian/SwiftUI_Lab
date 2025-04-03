import SwiftUI
import Foundation

// repository for managing app settings
class SettingsRepository {
    private let userDefaults = UserDefaults.standard
    private let darkModeKey = "isDarkMode"

    // get current theme preference ,gonna be default false if not set
    func isDarkModeEnabled() -> Bool {
        return userDefaults.bool(forKey: darkModeKey)
    }

    // update the theme preference in persistent storage
    func setDarkMode(_ enabled: Bool) {
        userDefaults.set(enabled, forKey: darkModeKey)
    }
}
