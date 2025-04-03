import SwiftUI

// view to display a list of worked  shifts
struct WorkedShiftsView: View {
    let shifts: [Shift]

    var body: some View {
        ForEach(shifts, id: \.id) { shift in
            NavigationLink(destination: ShiftDetailView(shift: shift)) {
                ShiftRowView(shift: shift)
            }
        }
    }
}
