import SwiftUI

// subview for a shift row - showing name and date of employee
struct ShiftRowView: View {
    let shift: Shift

    var body: some View {
        VStack(alignment: .leading) {
            if let employee = shift.employee {
                Text(employee.fullName)
                    .font(.headline)
            }
            Text(shift.date, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
