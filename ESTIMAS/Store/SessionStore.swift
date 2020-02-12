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

    private(set) var projectsStore: ProjectsStore!
    private(set) var workStore: WorkStore!
    private(set) var userStore: UserStore!
    private(set) var statsStore: StatsStore!
    private(set) var timerStore: TimerStore!

    init() {
        initStores()

        let tokenGet = getToken()
        if let token = tokenGet {
            self.token = token
            afterLogin()
        }
    }

    func initStores() {
        projectsStore = ProjectsStore(projects: [])
        workStore = WorkStore()
        userStore = UserStore()
        statsStore = StatsStore()
        timerStore = TimerStore(sessionStore: self)
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

        initStores()
    }
}
