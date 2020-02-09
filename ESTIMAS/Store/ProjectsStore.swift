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

    init(projects: [ProjectActivity]) {
        self.projects = projects
    }

    func fetchProjects() {
        getProjectActivitiesGrouped() { array in
            self.projects = array
        }
    }
}
