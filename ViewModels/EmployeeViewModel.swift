import SwiftUI
import SwiftData

// view model for employee list and it management
class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []

    // load all employees from storage by descending
    func loadEmployees(from context: ModelContext) {
        let repo = EmployeeRepository(context: context)
        employees = repo.getAllEmployees()
    }

    // add a new employee and refresh the list
    func addEmployee(firstName: String, lastName: String, context: ModelContext) {
        let repo = EmployeeRepository(context: context)
        repo.addEmployee(firstName: firstName, lastName: lastName)
        loadEmployees(from: context)
    }

    // remove and refresh the list
    func removeEmployee(_ employee: Employee, context: ModelContext) {
        let repo = EmployeeRepository(context: context)
        repo.deleteEmployee(employee)
        loadEmployees(from: context)
    }
}
