//
//  ProjectsStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Combine

class ProjectsStore : ObservableObject {
    @Published var projects: [ProjectActivity]
    @Published var state: FETCH_STATE = .hardLoading

    init(projects: [ProjectActivity]) {
        self.projects = projects
    }

    private func setupLoading() {
        if (state == .error) {
            state = .hardLoading
        } else {
            state = .softLoading
        }
    }

    func fetchProjects() {
        setupLoading()

        getProjectActivitiesGrouped({
            self.state = .error
        }) { array in
            self.projects = array
            self.state = .success
        }
    }
}
