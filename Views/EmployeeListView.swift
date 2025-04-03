import SwiftUI
import SwiftData

// view for listing all employees
struct EmployeesListView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = EmployeeViewModel()

    var body: some View {
        List(viewModel.employees, id: \.id) { employee in
            NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                VStack(alignment: .leading) {
                    Text(employee.fullName)
                        .font(.headline)
                    Text("ID: \(employee.id)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Employees")
        .onAppear {
            // load employees data when view appears
            viewModel.loadEmployees(from: modelContext)
        }
    }
}
