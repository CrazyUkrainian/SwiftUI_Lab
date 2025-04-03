import SwiftData
import Foundation

@Model
class Shift {
    // model for work shift data
    var date: Date
    var employee: Employee?    // reference to associated employee (if any)
    var id: UUID

    init(date: Date, employee: Employee? = nil) {
        self.date = date
        self.employee = employee
        self.id = UUID()
    }

    // check if this shift is upcoming in the future or worked in the past
    var isUpcoming: Bool {
        return date >= Date()
    }
}
