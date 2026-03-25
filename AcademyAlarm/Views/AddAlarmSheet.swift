//
//  AddAlarmSheet.swift
//  AcademyAlarm
//
//  Created by User on 26/03/26.
//

import SwiftUI

// MARK: - Add Alarm Sheet
struct AddAlarmSheet: View {
    // TODO: Annotate alarms and isPresented with @Binding to allow adding new alarms to the list and dismissing the sheet
    var alarms: [Alarm]
    // TODO: Annotate isPresented with @Binding to control sheet presentation
    var isPresented: Bool

    @State private var label = ""
    @State private var time = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section("Alarm Details") {
                    TextField("Label", text: $label)

                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                }

                Section {
                    Button(action: saveAlarm) {
                        HStack {
                            Spacer()
                            Text("Add")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .foregroundStyle(.blue)
                }
            }
            .navigationTitle("New Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        // TODO: Dismiss the sheet by setting isPresented to false when cancel button is tapped
                    }
                }
            }
        }
    }

    private func saveAlarm() {
        // TODO: Implement saveAlarm function
        // Steps:
        // 1. Create new Alarm instance with label, time, and isActive set to true
//        let newAlarm = Alarm(
//            time: time,
//            label: label.isEmpty ? "Alarm" : label,
//            isActive: true
//        )
        // 2. Append to alarms array
//        alarms.append(newAlarm)
        // 3. Dismiss the sheet by setting isPresented to false
//        isPresented = false
    }
}

#Preview {
    ContentView()
}
