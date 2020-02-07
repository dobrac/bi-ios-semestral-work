//
//  ContentView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var loggedIn: Bool = getToken() != nil

    @ViewBuilder
    var body: some View {
        if !loggedIn {
            LoginView(loggedIn: {
                self.loggedIn = true
            });
        } else {
            MainView(logout: {
                self.loggedIn = false
            });
        }
    }
}
