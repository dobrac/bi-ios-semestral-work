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
    @EnvironmentObject var timerStore: TimerStore
    
    var body: some View {
        VStack {
            if (!projectsStore.error) {
                base
            } else {
                base
                    .opacity(0)
                    .overlay (
                        ErrorLoadingView(action: {
                            self.projectsStore.fetchProjects()
                            self.timerStore.fetchLastTask()
                        })
                )
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
        .pullToRefresh(isShowing: $projectsStore.loading) {
            self.projectsStore.fetchProjects()
            self.timerStore.fetchLastTask(showLoading: false)
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
