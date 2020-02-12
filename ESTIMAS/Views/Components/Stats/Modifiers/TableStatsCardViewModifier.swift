//
//  TableStatsCardStyleView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TableStatsCardViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 8)
            .padding(.vertical, 30)
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5)
    }
}
