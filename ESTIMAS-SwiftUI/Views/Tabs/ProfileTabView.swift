//
//  ProfileTabView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ProfileTabView: View {
    @EnvironmentObject var sessionStore: SessionStore

    var body: some View {
        VStack {
            Text(sessionStore.token?.email ?? "Unknown")
            Button(action: {
                self.sessionStore.logout()
            }) {
                Text("Odhlásit se")
            }
        }
    }
}
