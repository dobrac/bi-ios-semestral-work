//
//  ProfileTabView.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

struct ProfileTabView: View {
    @EnvironmentObject var sessionStore: SessionStore
    @EnvironmentObject var userStore: UserStore
    
    @State var showImageOptions: Bool = false
    @State var selectedImageOption: UIImagePickerController.SourceType? = nil
    
    @State var showImagePicker: Bool = false
    @State var image: UIImage? = nil
    
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    withAnimation {
                        self.showImageOptions = true
                    }
                }) {
                    ProfilePictureView(profilePicture: userStore.profilePicture, geometry: geometry)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 20)
                .padding(.top, 40)
                .actionSheet(isPresented: $showImageOptions) {
                    ActionSheet(title: Text("Zvolte způsob pro nastavení nového profilového obrázku"),
                                buttons: getActionSheetButtons())
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(type: self.selectedImageOption!, image: self.$image).onDisappear {
                        guard let imageG = self.image else { return }
                        
                        let imageData: Data? = imageG.jpegData(compressionQuality: 0.4)
                        let imageStr = imageData?.base64EncodedString(options: .lineLength64Characters) ?? ""
                        
                        self.userStore.setProfilePicture(image: imageStr)
                    }
                }
                
                Text(userStore.user?.fullName ?? "Loading...").bold().font(.system(size: 35))
                Text(userStore.user?.email ?? "Loading...")
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.sessionStore.logout()
                }
            }) {
                Text("Odhlásit se")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(20)
        }
    }
    
    private func getActionSheetButtons() -> [ActionSheet.Button] {
        return [
            .default(Text("Fotoaparát"), action: {
                self.selectedImageOption = .camera
                self.showImagePicker = true
            }),
            .default(Text("Galerie"), action: {
                self.selectedImageOption = .photoLibrary
                self.showImagePicker = true
            }),
            .cancel(Text("Zrušit"))
        ]
    }
}
