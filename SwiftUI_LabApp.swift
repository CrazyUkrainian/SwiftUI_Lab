import SwiftUI
import SwiftData

@main
struct SwiftUI_LabApp: App {
    // use AppStorage for theme preference to persist and apply user selection
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @StateObject private var settingsViewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsViewModel)
                .preferredColorScheme(isDarkMode ? .dark : .light)  // apply dark or light mode&#8203;:contentReference[oaicite:3]{index=3}
        }
        .modelContainer(for: [Employee.self, Shift.self, Settings.self]) { result in
            // configure model container and seed initial data&#8203;:contentReference[oaicite:4]{index=4}
            do {
                let container = try result.get()
                let context = container.mainContext

                // seed a Settings object if none exists (default to light mode)
                if try context.fetchCount(FetchDescriptor<Settings>()) == 0 {
                    let defaultSettings = Settings(isDarkMode: false)
                    context.insert(defaultSettings)
                }
                // seed sample Employees and Shifts if none exist
                if try context.fetchCount(FetchDescriptor<Employee>()) == 0 {
                    // create sample employees
                    let emp1 = Employee(firstName: "John", lastName: "Doe")
                    let emp2 = Employee(firstName: "Jane", lastName: "Smith")
                    let emp3 = Employee(firstName: "Alice", lastName: "Brown")
                    context.insert(emp1); context.insert(emp2); context.insert(emp3)
                    // create sample shifts (dates relative to now)
                    let now = Date()
                    let past1 = Calendar.current.date(byAdding: .day, value: -2, to: now)!
                    let past2 = Calendar.current.date(byAdding: .day, value: -1, to: now)!
                    let future1 = Calendar.current.date(byAdding: .day, value: 1, to: now)!
                    let future2 = Calendar.current.date(byAdding: .day, value: 2, to: now)!
                    // assign shifts to employees
                    context.insert( Shift(date: past1, employee: emp1) )
                    context.insert( Shift(date: past2, employee: emp2) )
                    context.insert( Shift(date: future1, employee: emp2) )
                    context.insert( Shift(date: future2, employee: emp3) )
                }
            } catch {
                print("Error setting up model container: \(error)")
            }
        }
    }
}
