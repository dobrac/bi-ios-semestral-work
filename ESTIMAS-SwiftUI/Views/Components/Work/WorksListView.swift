//
//  WorksListView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorksListView: View {
    var workitems: [String] = ["Red","Raain","Rozi","Rozina","Rozinava", "Roy","Roy son","Rediss","Raj","Blue", "Yellow", "Red","Raain","Rozi","Rozina","Rozinava", "Roy","Roy son","Rediss","Raj","Blue", "Yellow"]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(self.workitems, id: \.self) { workitem in
                    WorkRowView()
                }
            }
        }
    }
}
