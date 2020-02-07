//
//  SessionStore.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class SessionStore : ObservableObject {
    @Published var token: Token?

    var projectsStore = ProjectsStore(projects: [])
    var timerStore = TimerStore()

    init() {
        let tokenGet = getToken()
        if let token = tokenGet {
            self.token = token
            afterLogin()
        }
    }

    func isLoggedIn() -> Bool {
        return token != nil
    }

    func login(username: String, password: String, _ completion: @escaping ((Token?)->())) {
        loginUser(username: username, password: password) { token in
            if let token = token {
                self.token = token
                saveToken(token: token)

                completion(token)

                self.afterLogin()
                return
            }
            completion(nil)
        }
    }

    func afterLogin() {
        self.projectsStore.fetchProjects()
        self.timerStore.fetchLastTask()
    }

    func logout() {
        self.token = nil
        clearToken()
    }
}
