//
//  ActivitiesListView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ActivitiesListView: View {
    @EnvironmentObject var projectsStore: ProjectsStore

    var body: some View {
        VStack {
            List {
                ForEach(projectsStore.projects){ projectActivity in
                    ProjectActivityView(projectActivity: projectActivity).frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .listSeparatorStyleNone()
            .pullToRefresh(isShowing: $projectsStore.loading) {
                self.projectsStore.fetchProjects()
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
