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
    @Published var loading: Bool = false

    init(projects: [ProjectActivity]) {
        self.projects = projects
    }

    func fetchProjects() {
        loading = true
        getProjectActivitiesGrouped() { array in
            self.projects = array
            self.loading = false
        }
    }
}
