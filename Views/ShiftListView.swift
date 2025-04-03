import SwiftUI
import SwiftData

// view for listing all shifts, separated into upcoming and worked sections
struct ShiftsListView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = ShiftViewModel()

    var body: some View {
        List {
            // upcoming
            if !viewModel.upcomingShifts.isEmpty {
                Section(header: Text("Upcoming Shifts")) {
                    UpcomingShiftsView(shifts: viewModel.upcomingShifts)
                }
            }
            // worked
            if !viewModel.workedShifts.isEmpty {
                Section(header: Text("Worked Shifts")) {
                    WorkedShiftsView(shifts: viewModel.workedShifts)
                }
            }
        }
        .navigationTitle("Shifts")
        .onAppear {
            viewModel.loadShifts(from: modelContext)
        }
    }
}
