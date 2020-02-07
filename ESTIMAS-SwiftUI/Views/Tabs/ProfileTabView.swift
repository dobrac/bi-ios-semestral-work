//
//  ProfileTabView.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ProfileTabView: View {
    var logout: () -> Void

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                clearToken()
                self.logout()
            }) {
                Text("Odhlásit se")
            }
        }
    }
}
