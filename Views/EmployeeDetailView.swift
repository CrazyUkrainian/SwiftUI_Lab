import SwiftUI

// view for displaying details of a single employee
struct EmployeeDetailView: View {
    let employee: Employee  // passed-in employee to show it

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name: \(employee.fullName)")
                .font(.title2)
            Text("Employee ID: \(employee.id.uuidString)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle(employee.lastName)
    }
}
