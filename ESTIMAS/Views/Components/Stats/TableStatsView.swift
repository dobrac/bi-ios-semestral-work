//
//  StatsView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct TableStatsView: View {
    @EnvironmentObject var statsStore: StatsStore
    var geometry: GeometryProxy

    var tableStats: TableStats? {
        get {
            statsStore.tableStats
        }
    }

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                TableStatsCardView(title: "Dnes", value: tableStats?.billedTimeToday ?? 0, geometry: geometry)
                Spacer()
                TableStatsCardView(title: "Včera", value: tableStats?.billedTimeYesterday ?? 0, alignment: .trailing, geometry: geometry)
                    .foregroundColor(.gray)
            }.modifier(TableStatsCardViewModifier()).padding(.top, 30)
            
            HStack {
                TableStatsCardView(title: "Tento týden", value: tableStats?.billedTimeThisWeek ?? 0, geometry: geometry)
                Spacer()
                TableStatsCardView(title: "Minulý týden", value: tableStats?.billedTimeLastWeek ?? 0, alignment: .trailing, geometry: geometry)
                    .foregroundColor(.gray)
            }.modifier(TableStatsCardViewModifier())

            HStack {
                TableStatsCardView(title: "Tento měsíc", value: tableStats?.billedTimeThisMonth ?? 0, geometry: geometry)
                Spacer()
                TableStatsCardView(title: "Minulý měsíc", value: tableStats?.billedTimeLastMonth ?? 0, alignment: .trailing, geometry: geometry)
                    .foregroundColor(.gray)
            }.modifier(TableStatsCardViewModifier())

            Spacer()
        }
    }
}
