//
//  ErrorLoadingView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 11/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ErrorLoadingView<Content: View>: View {
    var state: FETCH_STATE
    var action: () -> ()
    let viewBuilder: () -> Content

    init(state: FETCH_STATE, action: @escaping () -> (), viewBuilder: @escaping () -> Content) {
        self.state = state
        self.action = action
        self.viewBuilder = viewBuilder
    }

    var image = UIImage(systemName: "gobackward")!
        .withTintColor(.red, renderingMode: .alwaysTemplate)
        .withBaselineOffset(fromBottom: CGFloat.init(0))

    private var showContent: Bool {
        get {
            return state.isSuccess || state.isSoftLoading
        }
    }

    var body: some View {
        VStack {
            if (showContent) {
                viewBuilder()
            } else {
                AnyView(
                    VStack {
                        HStack {
                            Image(systemName: "circle.fill")
                            Image(systemName: "circle.fill")
                            Image(systemName: "circle.fill")
                        }
                        .padding(.bottom, 10)
                        .opacity(state.isLoading ? 1 : 0)
                        .animation(.easeIn(duration: 1))


                        if (state.isError) {
                            VStack {
                                Text("Nepodařilo se stáhnout data").foregroundColor(.secondary)
                                Button(action: {
                                    withAnimation {
                                        self.action()
                                    }
                                }) {
                                    HStack(alignment: .center) {
                                        Image(uiImage: image)
                                            .foregroundColor(.red)
                                            .font(.headline)
                                        Text("Zkusit znovu")
                                            .foregroundColor(.primary)
                                    }
                                }
                                .disabled(state.isLoading)
                            }
                            .opacity(state.isLoading ? 0 : 1)
                            .animation(.easeInOut(duration: 1))
                        }
                    }

                )
            }
        }.frame(maxHeight: .infinity)
    }
}
