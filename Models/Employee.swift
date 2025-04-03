import SwiftData
import Foundation

@Model
class Employee {
    // model for employee data
    var firstName: String
    var lastName: String
    var id: UUID

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = UUID()
    }

    // computed full name for display
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
