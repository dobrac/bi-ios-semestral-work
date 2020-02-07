//
//  TimerView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerStore: TimerStore

    var body: some View {
        TimerTaskView(workItem: timerStore.workItem)
            .frame(height: 30)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(14)
            .background(Color(red: 0.00, green: 0.41, blue: 0.71))
    }
}

struct TimerTaskView: View {
    @EnvironmentObject var timerStore: TimerStore
    var workItem: WorkItem?

    func isNotNil() -> Bool {
        return workItem != nil
    }

    func isLoading() -> Bool {
        return timerStore.loading
    }

    @State var showingAlert: Bool = false

    var body: some View {
        HStack {
            if isNotNil() {
                Button(action: {
                    self.showingAlert = true
                }) {
                    Image(systemName: "stop.circle.fill")
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .font(.system(size: 50))
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Konec?"),
                          message: Text("Opravdu chceš ukončit práci na činnosti?"),
                          primaryButton: .destructive(Text("Ano"), action: { self.timerStore.endTimer() } ),
                          secondaryButton: .default(Text("Ne")))
                }

                if isLoading() {
                    Text("Načítání...")
                        .foregroundColor(Color.white)
                } else {
                    Text(workItem!.activity.name)
                        .foregroundColor(Color.white)
                }
            } else {
                Text("Žádná činnost")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }
    }
}
