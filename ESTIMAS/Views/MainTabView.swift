//
//  MainView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct MainView: View {
    let geometry: GeometryProxy

    var body: some View {
        TabView {
            TimerTabView(geometry: geometry)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Domů")
                }
            WorkTabView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Práce")
                }
            StatsView(geometry: geometry)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Přehledy")
            }
            ProfileTabView(geometry: geometry)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profil")
            }
        }
        .font(.headline)
        .edgesIgnoringSafeArea(.top)
    }
}
