//
//  WorkRowView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorkRowView: View {
    @EnvironmentObject var workStore: WorkStore

    var workItem: WorkItem
    @State var showingMenu: Bool = false
    @State var showingEdit: Bool = false

    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Button(action: {
            self.showingMenu = true
        }) {
            HStack {
                ActivityView(activity: workItem.activity)
                Spacer()
                VStack {
                    Text(humanTime.string(from: workItem.getStartDate()))
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.primary)
                    Text(translateEndTime())
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.primary)
                }
                Text(secondsToString(seconds: workItem.getTimeElapsed(from: currentDate)))
                    .font(.system(.body, design: .monospaced))
                    .fontWeight(workItem.isRunning() ? .bold : nil)
                    .padding(.leading, 10)
                    .foregroundColor(.primary)
                    .onReceive(timer) { time in
                        self.currentDate = time
                }
            }.padding(.vertical, 10)
        }.sheet(isPresented: $showingEdit) {
            WorkRowEditView(workItem: self.workItem, startDate: self.workItem.getStartDate(), endDate: self.workItem.getEndDate()!, completion: { startDate, endDate in
                self.workStore.editWorkItem(workItem: self.workItem, startDate: startDate, endDate: endDate)
                withAnimation {
                    self.showingEdit = false
                }
            })
        }.actionSheet(isPresented: $showingMenu) {
            ActionSheet(title: Text(workItem.activity.name),
                        buttons: getActionSheetButtons())
        }
    }

    private func translateEndTime() -> String {
        return workItem.getEndDate().map({ humanTime.string(from: $0) }) ?? "---"
    }

    private func getActionSheetButtons() -> [ActionSheet.Button] {
        var toReturn: [ActionSheet.Button] = []
        if (workItem.endDate != emptyDate) {
            toReturn += [.default(Text("Upravit"),
                                  action: {
                                    withAnimation {
                                        self.showingEdit = true
                                    }
            })]
        }
        toReturn += [
            .destructive(Text("Smazat"), action: {
                self.workStore.removeWorkItem(workItem: self.workItem)
            }),
            .cancel(Text("Zrušit"))
        ]
        return toReturn
    }
}
