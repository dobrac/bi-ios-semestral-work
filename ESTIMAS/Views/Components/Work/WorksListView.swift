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
        VStack{
            if (!workStore.error) {
                base
            } else {
                base
                    .opacity(0)
                    .overlay (
                        ErrorLoadingView(action: {
                            self.workStore.fetchWorkItems()
                        })
                )
            }
        }
    }

    private var base: some View {
        List {
            HStack {
                Text("Činnost").font(.headline)
                Spacer()
                Text("Od - do").font(.headline)
                Text("Trvání").font(.headline).padding(.leading, 10).padding(.trailing, 35)
            }
            ForEach(workStore.workItems) { workItem in
                WorkRowView(workItem: workItem)
            }.onDelete(perform: delete)
        }
        .pullToRefresh(isShowing: $workStore.loading) {
            self.workStore.fetchWorkItems()
        }
    }


    private func delete(at offsets: IndexSet) {
        offsets.forEach {
            let workItem: WorkItem = workStore.workItems.remove(at: $0)
            workStore.removeWorkItem(workItem: workItem)
        }
    }
}
