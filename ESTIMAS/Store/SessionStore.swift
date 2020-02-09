//
//  SessionStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class SessionStore : ObservableObject {
    @Published var token: Token?

    var projectsStore: ProjectsStore
    var workStore: WorkStore
    var userStore: UserStore
    var statsStore: StatsStore
    private(set) var timerStore: TimerStore!

    init() {
        projectsStore = ProjectsStore(projects: [])
        workStore = WorkStore()
        userStore = UserStore()
        statsStore = StatsStore()
        timerStore = TimerStore(sessionStore: self)

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
        self.workStore.fetchWorkItems()
        self.userStore.fetchUserData()
        self.statsStore.fetchStats()
    }

    func logout() {
        self.token = nil
        clearToken()
    }
}
