//
//  UserStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class UserStore : ObservableObject {
    @Published var user: User?
    @Published var profilePicture: String?

    init() {
    }

    func fetchUserData() {
        getUser() { user in
            self.user = user
        }
        getProfilePicture() { profilePicture in
            self.profilePicture = profilePicture
        }
    }
}
