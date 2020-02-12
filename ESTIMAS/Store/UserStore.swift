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

    @Published var loading: Bool = false
    @Published var error: Bool = false

    init() {
    }

    func fetchUserData() {
        loading = true
        error = false

        getUser({
            self.error = true
            self.loading = false
        }) { user in
            self.user = user
            self.loading = false
        }
        fetchProfilePicture()
    }

    func fetchProfilePicture() {
        getProfilePicture({
            
        }) { profilePicture in
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
