//
//  ContentView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 05/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct LoginView: View {
    @EnvironmentObject var sessionStore: SessionStore

    @State private var username: String = "dobry@net-inout.cz"
    @State private var password: String = "152430"

    @State private var loading: Bool = false

    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://v10.server.estimas.cz/api/CompanyLogo/get/\(companyName)"))
                .resizable() // Resizable like SwiftUI.Image
                .scaledToFit()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0));

            VStack(alignment: .leading) {
                Text("Uživatel").bold()
                TextField("Uživatel", text: $username);

                Text("Heslo").bold().padding(.top, 20)
                SecureField("Heslo", text: $password);
            }.padding(.bottom, 10)

            Button(action: {
                self.loading = true
                self.sessionStore.login(username: self.username, password: self.password) { _ in
                    self.loading = false
                }
            }) {
                Text(loading ? "Přihlašování se..." : "Přihlásit se")
                    .padding(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .disabled(loading);
        }
        .padding(40)
        .fillParent(alignment: .center)
        .modifier(AdaptsToSoftwareKeyboard())
    }
}
