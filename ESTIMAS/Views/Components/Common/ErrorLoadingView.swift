//
//  ErrorLoadingView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 11/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ErrorLoadingView: View {
    var action: () -> ()

    var image = UIImage(systemName: "gobackward")!
        .withTintColor(.red, renderingMode: .alwaysTemplate)
        .withBaselineOffset(fromBottom: CGFloat.init(0))

    var body: some View {
        VStack {
            Text("Nepodařilo se stáhnout data").foregroundColor(.secondary)
            Button(action: action) {
                HStack(alignment: .center) {
                    Image(uiImage: image)
                        .foregroundColor(.red)
                        .font(.headline)
                    Text("Zkusit znovu")
                        .foregroundColor(.primary)
                }
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
