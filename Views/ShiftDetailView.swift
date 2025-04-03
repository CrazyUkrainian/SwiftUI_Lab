import SwiftUI

// view for displaying details of a single shift
struct ShiftDetailView: View {
    let shift: Shift

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shift Date: \(shift.date.formatted(date: .long, time: .shortened))")
                .font(.title3)
            if let employee = shift.employee {
                Text("Employee: \(employee.fullName)")
                    .font(.headline)
            }
        }
        .padding()
        .navigationTitle("Shift Details")
    }
}
