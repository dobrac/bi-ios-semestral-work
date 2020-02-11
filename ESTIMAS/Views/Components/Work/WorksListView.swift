//
//  WorksListView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct WorksListView: View {
    @EnvironmentObject var workStore: WorkStore

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Text("Činnost").font(.headline)
                    Spacer()
                    Text("Od - do").font(.headline)
                    Text("Trvání").font(.headline).padding(.leading, 10).padding(.trailing, 40)
                }
                .padding(.horizontal, 10)
                Divider()
            }

            List {
                ForEach(workStore.workItems) { workItem in
                    WorkRowView(workItem: workItem)
                }.onDelete(perform: delete)
            }
            .pullToRefresh(isShowing: $workStore.loading) {
                self.workStore.fetchWorkItems()
            }
        }
    }

    func delete(at offsets: IndexSet) {
        offsets.forEach {
            let workItem: WorkItem = workStore.workItems.remove(at: $0)
            workStore.removeWorkItem(workItem: workItem)
        }
    }
}
