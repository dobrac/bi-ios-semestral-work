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

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ActivityView(activity: workItem.activity)
                Spacer()
                VStack {
                    Text(humanTime.string(from: workItem.getStartDate())).font(.system(.body, design: .monospaced))
                    workItem.getEndDate().map({
                        Text(humanTime.string(from: $0)).font(.system(.body, design: .monospaced))
                    })
                }
                Text(secondsToString(seconds: workItem.getTimeElapsed(from: Date())))
                    .font(.system(.body, design: .monospaced))
                    .padding(.leading, 10)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            Divider()
        }
    }
}
