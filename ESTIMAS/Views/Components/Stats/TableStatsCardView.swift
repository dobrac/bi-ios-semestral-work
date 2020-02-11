//
//  TableStatsCardView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TableStatsCardView: View {
    var title: String
    var value: Int

    var alignment: HorizontalAlignment = .leading

    var geometry: GeometryProxy

    var body: some View {
        VStack(alignment: alignment) {
            Text(title)
            Text(formatWorked(seconds: value)).font(.headline)
        }
    }
}
