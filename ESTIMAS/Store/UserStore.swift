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

    @Published var state: FETCH_STATE = .hardLoading

    init() {
    }

    private func setupLoading() {
        if (state == .error) {
            state = .hardLoading
        } else {
            state = .softLoading
        }
    }

    func fetchUserData() {
        setupLoading()

        getUser({
            self.state = .error
        }) { user in
            self.user = user
            self.state = .success
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
