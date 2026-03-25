//
//  EditAlarmSheet.swift
//  AcademyAlarm
//
//  Created by User on 26/03/26.
//

import SwiftUI

// MARK: - Edit Alarm Sheet
struct EditAlarmSheet: View {
    // TODO: Annotate alarm with @Binding to allow editing its properties and isPresented with @Binding to control sheet presentation
    var alarm: Alarm
    // TODO: Annotate isPresented with @Binding to control sheet presentation
    var isPresented: Bool

    var body: some View {
        NavigationStack {
            Form {
                // TODO: Bind TextField to alarm.label, DatePicker to alarm.time, and Toggle to alarm.isActive to allow editing these properties in the sheet
                Section("Alarm Details") {
                    TextField("Label", text: .constant(alarm.label))
                    DatePicker("Time", selection: .constant(alarm.time), displayedComponents: .hourAndMinute)
                    Toggle("Active", isOn: .constant(alarm.isActive))
                }

                Section {
                    Button(
                        action: {
                            //TODO: done action that dismisses the modal
                        }
                    ) {
                        HStack {
                            Spacer()
                            Text("Done")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .foregroundStyle(.blue)
                }
            }
            .navigationTitle("Edit Alarm")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
