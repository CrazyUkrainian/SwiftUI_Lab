import SwiftUI
import Foundation

// view model for app settings -theme toggle
class SettingsViewModel: ObservableObject {
    // published dark mode flag, pretty much updates persistent setting on change
    @Published var isDarkMode: Bool {
        didSet {
            repository.setDarkMode(isDarkMode)
        }
    }
    private let repository = SettingsRepository()

    init() {
        // initialize from stored preference
        self.isDarkMode = repository.isDarkModeEnabled()
    }
}
