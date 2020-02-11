//
//  TimerView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerStore: TimerStore
    let geometry: GeometryProxy
    
    var body: some View {
        TimerTaskView(workItem: self.timerStore.workItem)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(14)
            .padding(.top, geometry.safeAreaInsets.top)
            .background(Color(red: 0.00, green: 0.41, blue: 0.71))
    }
}

struct TimerTaskView: View {
    @EnvironmentObject var timerStore: TimerStore
    var workItem: WorkItem?

    func isNotNil() -> Bool {
        return workItem != nil || isLoading()
    }

    func isLoading() -> Bool {
        return timerStore.loading
    }

    @State var showingAlert: Bool = false

    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            if isNotNil() {
                Button(action: {
                    self.showingAlert = true
                }) {
                    Image(systemName: "stop.circle.fill")
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .font(.system(size: 70))
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Konec?"),
                          message: Text("Opravdu chceš ukončit práci na činnosti?"),
                          primaryButton: .destructive(Text("Ano"), action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                self.timerStore.endTimer()
                            }
                          }),
                          secondaryButton: .default(Text("Ne")))
                }.padding(.trailing, 5)

                if isLoading() {
                    Text("Načítání...")
                        .foregroundColor(Color.white)
                        .font(.headline)
                } else {
                    VStack(alignment: .leading) {
                        Text(workItem!.activity.name)
                            .foregroundColor(Color.white)
                            .font(.headline)
                        Text(secondsToString(seconds: workItem!.getTimeElapsed(from: currentDate)))
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(Color.white)
                            .onReceive(timer) { time in
                                self.currentDate = time
                        }
                    }
                }
            } else {
                Text("Žádná činnost")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }
    }
}
