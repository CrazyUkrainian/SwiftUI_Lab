import SwiftUI

// main content view with tab-based navigation
struct ContentView: View {
    var body: some View {
        TabView {
            // Employees tab
            NavigationStack {
                EmployeesListView()
            }
            .tabItem {
                Label("Employees", systemImage: "person.3.fill") //? HINT - change placeholders for system image
            }

            // Shifts tab
            NavigationStack {
                ShiftsListView()
            }
            .tabItem {
                Label("Shifts", systemImage: "calendar.badge.clock")
            }

            // Settings tab
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}
