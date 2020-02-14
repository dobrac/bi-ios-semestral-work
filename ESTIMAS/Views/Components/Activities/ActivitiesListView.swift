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
    @EnvironmentObject var timerStore: TimerStore
    
    var body: some View {
        VStack {
            ErrorLoadingView(state: $projectsStore.state, action: {
                self.projectsStore.fetchProjects()
                self.timerStore.fetchLastTask()
            }) {
                self.base
            }
        }
    }
    
    private var base: some View {
        List {
            ForEach(projectsStore.projects){ projectActivity in
                ProjectActivityView(projectActivity: projectActivity).frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .listSeparatorStyleNone()
        .pullToRefresh(isShowing: $projectsStore.state.isLoading) {
            self.projectsStore.fetchProjects()
            self.timerStore.fetchLastTask()
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
