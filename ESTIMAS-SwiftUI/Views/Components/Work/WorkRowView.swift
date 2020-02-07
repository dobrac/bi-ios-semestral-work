//
//  WorkRowView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct WorkRowView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Projekt")
                Text("Název činnosti")
                Divider()
            }
            Spacer()
        }
    }
}
