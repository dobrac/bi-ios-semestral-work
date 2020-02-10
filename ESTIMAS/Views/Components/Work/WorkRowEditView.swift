//
//  WorkRowEditView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorkRowEditView: View {
    var workItem: WorkItem

    @State var startDate: Date
    @State var endDate: Date

    var completion: (_ startDate: Date, _ endDate: Date) -> ()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    ActivityView(activity: self.workItem.activity)
                    DatePicker(selection: $startDate) {
                        Text("Začátek")
                    }

                    DatePicker(selection: $endDate) {
                        Text("Konec")
                    }

                    Button(action: {
                        self.completion(self.startDate, self.endDate)
                    }) {
                        Text("Upravit")
                    }.fillParent(alignment: .center)
                }
            }
            .navigationBarTitle(Text("Editace práce"), displayMode: .inline)
        }
    }
}
