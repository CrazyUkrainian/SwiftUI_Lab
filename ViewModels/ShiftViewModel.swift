import SwiftUI
import SwiftData

// view model for shifts list, future and past
class ShiftViewModel: ObservableObject {
    @Published var allShifts: [Shift] = []
    @Published var upcomingShifts: [Shift] = []
    @Published var workedShifts: [Shift] = []

    // load all shifts from storage and separate into upcoming vs worked
    func loadShifts(from context: ModelContext) {
        let repo = ShiftRepository(context: context)
        // fetch all shifts sorted by date in ascending ord
        allShifts = repo.getAllShifts()
        // split by date relative to now
        let now = Date()
        upcomingShifts = allShifts.filter { $0.date >= now }
        workedShifts = allShifts.filter { $0.date < now }
        // for better UX, show worked shifts in descending date
        workedShifts.sort { $0.date > $1.date }
    }

    func addShift(date: Date, employee: Employee?, context: ModelContext) {
        let repo = ShiftRepository(context: context)
        repo.addShift(date: date, for: employee)
        loadShifts(from: context)
    }

    func removeShift(_ shift: Shift, context: ModelContext) {
        let repo = ShiftRepository(context: context)
        repo.deleteShift(shift)
        loadShifts(from: context)
    }
}
