import SwiftData
import Foundation

// repository for managing employee data
class EmployeeRepository {
    private var context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    // fetch all employees, sorted by last name in descending order
    func getAllEmployees() -> [Employee] {
        let descriptor = FetchDescriptor<Employee>(
            sortBy: [SortDescriptor(\Employee.lastName, order: .reverse)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    // add a new employee to the persistent store
    func addEmployee(firstName: String, lastName: String) {
        let newEmployee = Employee(firstName: firstName, lastName: lastName)
        context.insert(newEmployee)
        // (autosave should persist this new employee)
    }

    // remove from the store
    func deleteEmployee(_ employee: Employee) {
        context.delete(employee)
    }
}
