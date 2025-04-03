import SwiftData
import Foundation

class ShiftRepository {
    private var context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    // fetch all shifts, sorted by date ascending
    func getAllShifts() -> [Shift] {
        let descriptor = FetchDescriptor<Shift>(
            sortBy: [SortDescriptor(\Shift.date, order: .forward)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    // fetch upcoming shifts,  by date in ascending order
    func getUpcomingShifts() -> [Shift] {
        let now = Date()
        let predicate = #Predicate<Shift> { $0.date >= now }
        let descriptor = FetchDescriptor<Shift>(
            predicate: predicate,
            sortBy: [SortDescriptor(\Shift.date, order: .forward)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    // fetch worked shifts, sorted by date descending
    func getWorkedShifts() -> [Shift] {
        let now = Date()
        let predicate = #Predicate<Shift> { $0.date < now }
        let descriptor = FetchDescriptor<Shift>(
            predicate: predicate,
            sortBy: [SortDescriptor(\Shift.date, order: .reverse)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    // add a new shift to the persistent store
    func addShift(date: Date, for employee: Employee?) {
        let newShift = Shift(date: date, employee: employee)
        context.insert(newShift)
    }

    func deleteShift(_ shift: Shift) {
        context.delete(shift)
    }
}
