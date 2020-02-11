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
    var profilePicture: String?

    let geometry: GeometryProxy

    var width: CGFloat {
        get {
            return geometry.frame(in: .global).width * 0.6
        }
    }

    var body: some View {
        Image(uiImage: profilePicture?.base64ToImage() ?? UIImage(systemName: "circle.fill") ?? UIImage())
            .resizable()
            .frame(width: width, height: width, alignment: .center)
            .cornerRadius(.infinity)
}
