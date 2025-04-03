import SwiftUI

// view to display a list of upcoming shifts
struct UpcomingShiftsView: View {
    let shifts: [Shift]

    var body: some View {
        ForEach(shifts, id: \.id) { shift in
            NavigationLink(destination: ShiftDetailView(shift: shift)) {
                ShiftRowView(shift: shift)
            }
        }
    }
}
