//
//  WorksListView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorksListView: View {
    @EnvironmentObject var workStore: WorkStore

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Činnost")
                    Spacer()
                    Text("Od - do")
                    Text("Trvání").padding(.leading, 10).padding(.trailing, 40)
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
            Divider().padding(.top, 10)
            List {
                ForEach(workStore.workItems) { workItem in
                    WorkRowView(workItem: workItem).frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
    }
}
