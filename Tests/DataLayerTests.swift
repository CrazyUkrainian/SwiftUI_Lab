import XCTest
import SwiftData
@testable import SwiftUI_Lab

// tests for data layer (models and repositories)
final class DataLayerTests: XCTestCase {

    // test for employees, are fetched in reverse order by last name
    func testEmployeeSorting() throws {
        // for in-memory model container for testing
        let container = try ModelContainer(for: [Employee.self, Shift.self], inMemory: true)
        let context = container.mainContext

        // insert sample employees.  out of order,  by last name
        let empA = Employee(firstName: "Oleks", lastName: "Terekhov")
        let empB = Employee(firstName: "Cameron", lastName: "Barbeau")
        let empC = Employee(firstName: "Hunter", lastName: "Breathat")
        context.insert(empA); context.insert(empB); context.insert(empC)

        // fetch all employees via repository
        let repo = EmployeeRepository(context: context)
        let allEmployees = repo.getAllEmployees()

        // expected last name order: Oleks - cameron - hunter
        let sortedLastNames = allEmployees.map { $0.lastName }
        XCTAssertEqual(sortedLastNames, ["Oleks", "Cameron", "Hunter"])
    }

    // test for shifts, are fetched in ascending order by date and categorized correctly
    func testShiftSortingAndFiltering() throws {
        let container = try ModelContainer(for: [Employee.self, Shift.self], inMemory: true)
        let context = container.mainContext

        // create one employee and two shifts: one in past, one in future
        let emp = Employee(firstName: "Test", lastName: "User")
        context.insert(emp)
        let now = Date()
        let pastDate = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        let futureDate = Calendar.current.date(byAdding: .day, value: 1, to: now)!
        context.insert( Shift(date: pastDate, employee: emp) )
        context.insert( Shift(date: futureDate, employee: emp) )

        // fetch  repo
        let repo = ShiftRepository(context: context)
        let allShifts = repo.getAllShifts()
        XCTAssertEqual(allShifts.count, 2)
        // check ascending order: first element should be the past shift, then future
        XCTAssertLessThan(allShifts[0].date, allShifts[1].date)

        // check upcoming vs worked filtering
        let upcoming = repo.getUpcomingShifts()
        let worked = repo.getWorkedShifts()
        XCTAssertEqual(upcoming.count, 1)
        XCTAssertEqual(worked.count, 1)
        XCTAssertTrue(upcoming.first!.date >= now)
        XCTAssertTrue(worked.first!.date < now)
    }
}
