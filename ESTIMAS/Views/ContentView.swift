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
        if sessionStore.isLoggedIn() {
            MainView()
        } else {
            LoginView();
        }
    }
}
