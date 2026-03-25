//
//  AlarmListRow.swift
//  AcademyAlarm
//
//  Created by User on 26/03/26.
//

import SwiftUI

// MARK: - Alarm Row View
struct AlarmRowView: View {
    // TODO: Annotate alarm with @Binding to allow editing its properties in EditAlarmSheet
    var alarm: Alarm
    // TODO: Annotate isShowingEditModal with @State to control edit alarm sheet presentation
    var isShowingEditModal = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(alarm.label)
                    .fontWeight(.semibold)

                Text(alarm.formattedTime())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // TODO: Bind toggle to alarm.isActive to allow toggling active state directly from the list row
            Toggle("", isOn: .constant(alarm.isActive))
                .tint(.blue)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            // TODO: Set isShowingEditModal to true to present the edit alarm sheet when the row is tapped
        }
        // TODO: Present EditAlarmSheet modal when isShowingEditModal is true
        .sheet(isPresented: .constant(isShowingEditModal)) {
            EditAlarmSheet(alarm: alarm, isPresented: isShowingEditModal)
        }
    }
}

#Preview {
    ContentView()
}
