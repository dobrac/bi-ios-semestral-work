//
//  ActivitiesListView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ActivitiesListView: View {
    @EnvironmentObject var projectsStore: ProjectsStore

    var body: some View {
        VStack {
            List {
                ForEach(projectsStore.projects){ projects in
                    ProjectActivityView(projectActivity: projects).frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
    }
}

struct ProjectActivityView: View {
    let projectActivity: ProjectActivity

    var body: some View {
        ForEach(projectActivity.activities){ activity in
            ActivityRowView(activity: activity)
        }
    }
}
