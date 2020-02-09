//
//  TimerTabView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TimerTabView: View {
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 0) {
            TimerView(geometry: geometry)
            ActivitiesListView()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
