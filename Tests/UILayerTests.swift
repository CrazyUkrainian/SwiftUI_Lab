import XCTest
@testable import SwiftUI_Lab

final class UILayerTests: XCTestCase {

    // test that SettingsViewModel toggles dark mode and persists with it
    func testDarkModeTogglePersistence() throws {
        let repo = SettingsRepository()
        // ensure starting state is false
        repo.setDarkMode(false)
        var vm = SettingsViewModel()
        XCTAssertFalse(vm.isDarkMode)

        // toggle dark mode to true
        vm.isDarkMode = true
        // check that persistent storage is updated
        XCTAssertTrue(repo.isDarkModeEnabled())

        // simulate app restart: create a new VM and it should read persisted value
        vm = SettingsViewModel()
        XCTAssertTrue(vm.isDarkMode)

        // toggle back to false and verify it, in case
        vm.isDarkMode = false
        XCTAssertFalse(repo.isDarkModeEnabled())
    }
}
