//
//  ProfilePicture.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import SwiftUI

extension String {
    func base64ToImage() -> UIImage? {
        let dataDecoded : Data = Data(base64Encoded: self, options: .ignoreUnknownCharacters)!
        return UIImage(data: dataDecoded)
    }
}

struct ProfilePictureView: View {
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        Image(uiImage: userStore.profilePicture?.base64ToImage() ?? UIImage(systemName: "circle.fill") ?? UIImage()).cornerRadius(.infinity)
    }
}
