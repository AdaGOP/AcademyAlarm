//
//  ContentView.swift
//  AcademyAlarm
//
//  Created by User on 24/03/26.
//

import SwiftUI

struct ContentView: View {
    //TODO: annotate alarms with @State to make it mutable and reactive
    @State var alarms: [Alarm] = [
        Alarm(time: Calendar.current.date(byAdding: .hour, value: 7, to: Date())!, label: "Morning Jog"),
        Alarm(time: Calendar.current.date(byAdding: .hour, value: 22, to: Date())!, label: "Bedtime")
    ]
    
    //TODO: annotate isShowingAddModal with @State to control add alarm sheet presentation
    var isShowingAddModal = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Alarms List
                if alarms.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "moon.zzz")
                            .font(.system(size: 64))
                            .foregroundStyle(.secondary)

                        Text("No alarms yet")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("Create your first alarm")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // TODO: Use ForEach with $binding to allow editing alarms in AlarmRowView
                    List {
                        ForEach(alarms) { alarm in
                            AlarmRowView(alarm: alarm)
                        }
                        .onDelete { indices in
                            // TODO: Implement deletion of alarms at specified indices
                        }
                    }
                    .listStyle(.inset)
                }

                // MARK: - Add Button
                VStack {
                    Button(
                        action: {
                            // TODO: Set isShowingAddModal to true to present the add alarm sheet
                        }
                    ) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Alarm")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                .background(Color(.systemBackground))
            }
            .navigationTitle("Alarms")
            .navigationBarTitleDisplayMode(.inline)
            // TODO: Present AddAlarmSheet modal when isShowingAddModal is true
            .sheet(isPresented: .constant(isShowingAddModal)) {
                // TODO: Pass alarms and isShowingAddModal as bindings to AddAlarmSheet for adding new alarms and dismissing the sheet
                AddAlarmSheet(alarms: alarms, isPresented: isShowingAddModal)
            }
        }
        .onAppear {
            /// this will force refresh the state to fix List onDelete bug
            alarms.append(.init())
            alarms.removeLast()
        }
    }
}

#Preview {
    ContentView()
}
