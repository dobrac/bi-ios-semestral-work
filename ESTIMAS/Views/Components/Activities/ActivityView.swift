//
//  ActivityView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 08/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity

    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.project.name)
                .foregroundColor(activity.color)
            Text(activity.name)
                .foregroundColor(.black)
        }
    }
}
