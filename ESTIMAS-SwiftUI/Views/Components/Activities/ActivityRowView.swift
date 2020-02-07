//
//  ActivityRowView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ActivityRowView: View {
    @EnvironmentObject var timerStore: TimerStore
    @State var activity: Activity

    var color: Color {
        get {
            return Color(hexStringToUIColor(hex: activity.project.color))
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                self.timerStore.startTimer(activity: self.activity)
            }) {
                HStack {
                    Image(systemName: "chevron.right")
                        .foregroundColor(color)
                        .font(Font.system(size: 25).weight(.heavy))
                        .padding(.trailing, 10)
                        .padding(.leading, 5)
                    VStack(alignment: .leading) {
                        Text(activity.project.name)
                            .foregroundColor(color)
                        Text(activity.name)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }.padding(5)
            }
            Divider()
        }
    }
}
