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

    @State private var username: String = ""
    @State private var password: String = ""

    @State private var loading: Bool = false
    @State private var showError: Bool = false

    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://v10.server.estimas.cz/api/CompanyLogo/get/\(companyName)"))
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50);

            VStack(alignment: .leading) {
                Text("Uživatel").bold()
                TextField("Uživatel", text: $username)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                Text("Heslo").bold().padding(.top, 20)
                SecureField("Heslo", text: $password).textContentType(.password)
            }.padding(.bottom, 10)

            if (showError) {
                Text("Nesprávný email nebo heslo.").foregroundColor(.red).padding(.vertical, 10)
            }

            Button(action: {
                self.loading = true
                self.sessionStore.login(username: self.username, password: self.password) { token in
                    self.showError = token == nil
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
