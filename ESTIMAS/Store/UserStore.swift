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

    @Published var state: FETCH_STATE = .loading

    init() {
    }

    func fetchUserData(_ completion: @escaping () -> Void = {}) {
        state = .loading

        getUser({
            self.state = .error
            completion()
        }) { user in
            self.user = user
            self.state = .success
            completion()
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
