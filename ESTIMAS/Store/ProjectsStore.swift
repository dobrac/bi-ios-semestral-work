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
    @Published var state: FETCH_STATE = .loading

    init(projects: [ProjectActivity]) {
        self.projects = projects
    }

    func fetchProjects(_ completion: @escaping () -> Void = {}) {
        state = .loading

        getProjectActivitiesGrouped({
            self.state = .error
            completion()
        }) { array in
            self.projects = array
            self.state = .success
            completion()
        }
    }
}
