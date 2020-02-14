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
        VStack{
            ErrorLoadingView(state: $workStore.state, action: {
                self.workStore.fetchWorkItems()
            }) {
                self.base
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
        .pullToRefresh(isShowing: $workStore.state.isLoading) {
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
