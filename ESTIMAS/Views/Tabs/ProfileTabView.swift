//
//  ProfileTabView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ProfileTabView: View {
    @EnvironmentObject var sessionStore: SessionStore
    @EnvironmentObject var userStore: UserStore

    var body: some View {
        VStack {
            VStack {
                ProfilePictureView().padding(.bottom, 20).padding(.top, 40)
                Text(userStore.user?.fullName ?? "Loading...").bold().font(.system(size: 35))
                Text(userStore.user?.email ?? "Loading...")
            }

            Spacer()

            Button(action: {
                withAnimation {
                    self.sessionStore.logout()
                }
            }) {
                Text("Odhlásit se")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(20)
            }
        }
    }
}
