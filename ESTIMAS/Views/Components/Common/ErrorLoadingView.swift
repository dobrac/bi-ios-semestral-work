//
//  ErrorLoadingView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 11/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ErrorLoadingView<Content: View>: View {
    @Binding var state: FETCH_STATE

    var action: () -> ()
    let viewBuilder: () -> Content

    init(state: Binding<FETCH_STATE>, action: @escaping () -> (), viewBuilder: @escaping () -> Content) {
        self._state = state
        self.action = action
        self.viewBuilder = viewBuilder
    }

    var image = UIImage(systemName: "gobackward")!
        .withTintColor(.red, renderingMode: .alwaysTemplate)
        .withBaselineOffset(fromBottom: CGFloat.init(0))

    @State var waitForSuccess = false

    var showError: Bool {
        get {
            if (state.isSuccess) {
                DispatchQueue.main.async {
                    self.waitForSuccess = false
                }
            }
            return state.isError || waitForSuccess
        }
    }

    var body: some View {
        ZStack {
            viewBuilder()
                .opacity(showError ? 0 : 1)
                .animation(.easeInOut(duration: 0.2))

            if (showError) {
                VStack {
                    HStack {
                        Image(systemName: "circle.fill")
                        Image(systemName: "circle.fill")
                        Image(systemName: "circle.fill")
                    }
                    .padding(.bottom, 10)
                    .opacity(state.isLoading ? 1 : 0)
                    .animation(.easeInOut(duration: 1))


                    VStack {
                        Text("Nepodařilo se stáhnout data").foregroundColor(.secondary)
                        Button(action: {
                            self.waitForSuccess = true
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
                }
            }
        }.frame(maxHeight: .infinity)
    }
}
