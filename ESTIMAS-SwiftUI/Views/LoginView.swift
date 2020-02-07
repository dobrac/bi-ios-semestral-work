//
//  ContentView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 05/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct LoginView: View {
    @State private var username: String = "dobry@net-inout.cz"
    @State private var password: String = "152430"

    @State private var loading: Bool = false

    var loggedIn: () -> Void

    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://v10.server.estimas.cz/api/CompanyLogo/get/\(companyName)"))
                .resizable() // Resizable like SwiftUI.Image
                .scaledToFit()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0));
            TextField("Uživatel", text: $username);
            SecureField("Heslo", text: $password);
            Button(action: {
                self.loading = true
                login(username: self.username, password: self.password) { token in
                    if let token = token {
                        saveToken(token: token)
                        self.loggedIn()
                    }
                    self.loading = false
                }
            }) {
                Text("Přihlásit se")
            }.disabled(loading);
        }
        .padding(40);
    }
}
