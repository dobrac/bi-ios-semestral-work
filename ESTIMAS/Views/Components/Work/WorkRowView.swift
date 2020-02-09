//
//  WorkRowView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorkRowView: View {
    var workItem: WorkItem
    @State var showingMenu: Bool = false
    @State var showingEdit: Bool = false

    var body: some View {
        Button(action: {
            withAnimation {
                self.showingMenu = true
            }
        }) {
            HStack {
                ActivityView(activity: workItem.activity)
                Spacer()
                VStack {
                    Text(humanTime.string(from: workItem.getStartDate())).font(.system(.body, design: .monospaced))
                        .foregroundColor(.primary)
                    workItem.getEndDate().map({
                        Text(humanTime.string(from: $0)).font(.system(.body, design: .monospaced))
                            .foregroundColor(.primary)
                    })
                }
                Text(secondsToString(seconds: workItem.getTimeElapsed(from: Date())))
                    .font(.system(.body, design: .monospaced))
                    .padding(.leading, 10)
                    .foregroundColor(.primary)
            }
        }.actionSheet(isPresented: $showingMenu) {
            ActionSheet(title: Text(workItem.activity.name),
                        buttons: [
                            .default(Text("Upravit"), action: {
                                withAnimation {
                                    self.showingEdit = true
                                }
                            }),
                            .destructive(Text("Smazat"), action: {
                            }),
                            .cancel(Text("Zrušit"))
            ])
        }.sheet(isPresented: $showingEdit) {
            WorkRowEditView(workItem: self.workItem)
        }
    }
}
