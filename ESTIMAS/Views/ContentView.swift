//
//  ContentView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionStore: SessionStore

    @ViewBuilder
    var body: some View {
        GeometryReader { geometry in
            if self.sessionStore.isLoggedIn() {
                MainView(geometry: geometry)
                    .environmentObject(self.sessionStore.projectsStore)
                    .environmentObject(self.sessionStore.timerStore)
                    .environmentObject(self.sessionStore.workStore)
                    .environmentObject(self.sessionStore.userStore)
                    .environmentObject(self.sessionStore.statsStore)
            } else {
                LoginView()
            }
        }
    }
}
