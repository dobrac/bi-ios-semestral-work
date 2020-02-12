//
//  StatsView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    var geometry: GeometryProxy

    var body: some View {
        NavigationView {
            TableStatsView(geometry: geometry)
                .navigationBarTitle("Přehledy")
        }
    }
}
