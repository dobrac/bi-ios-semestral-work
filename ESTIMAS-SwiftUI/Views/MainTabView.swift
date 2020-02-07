//
//  MainView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TimerTabView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Domů")
                }
            WorkTabView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Práce")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Přehledy")
            }
            ProfileTabView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profil")
            }
        }
        .font(.headline)
    }
}
