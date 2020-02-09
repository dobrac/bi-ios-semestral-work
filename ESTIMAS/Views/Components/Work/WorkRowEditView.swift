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
    
    var body: some View {
        ScrollView {
            VStack {
                ActivityView(activity: self.workItem.activity)
            }
        }
    }
}
