//
//  ActivityRowView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ActivityRowView: View {
    @EnvironmentObject var timerStore: TimerStore
    @State var activity: Activity
    @State var showingStart: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.showingStart = true
                }
            }) {
                HStack {
                    Image(systemName: "chevron.right")
                        .foregroundColor(activity.color)
                        .font(Font.system(size: 25).weight(.heavy))
                        .padding(.trailing, 10)
                        .padding(.leading, 5)
                    ActivityView(activity: activity)
                    Spacer()
                }.padding(5)
            }.actionSheet(isPresented: $showingStart) {
                ActionSheet(title: Text(activity.name),
                            message: Text("Opravdu chceš spustit práci na činnosti?"),
                            buttons: [
                                .default(Text("Spustit činnost"), action: {
                                     withAnimation(.easeInOut(duration: 0.2)) {
                                        self.timerStore.startTimer(activity: self.activity)
                                    }
                                }),
                                .cancel(Text("Zrušit"))
                ])
            }
            Divider()
        }
    }
}
