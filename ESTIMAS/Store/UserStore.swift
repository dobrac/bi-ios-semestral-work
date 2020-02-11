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
        fetchProfilePicture()
    }

    func fetchProfilePicture() {
        getProfilePicture() { profilePicture in
            self.profilePicture = profilePicture
        }
    }

    func setProfilePicture(image: String) {
        self.profilePicture = image
        ESTIMAS.setProfilePicture(image: image) {
            self.fetchProfilePicture()
        }
    }
}
