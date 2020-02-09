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
            .padding(8)
            .background(Color(.white))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5)
            .padding(.leading, 10)
            .padding(.trailing, 10)
    }
}
