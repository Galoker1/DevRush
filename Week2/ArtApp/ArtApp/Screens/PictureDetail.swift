//
//  ArtistDetail.swift
//  ArtApp
//
//  Created by Егор  Хлямов on 18.02.2024.
//

import Foundation
import SwiftUI

struct PictureDetailView: View {
    @State var picture: Work
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            HStack {
                Text(picture.title)
                Spacer()
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            Spacer()
            Image(picture.image)
            Text(picture.info)
            Spacer()
        }
        .background(Color.black)
        .foregroundColor(.white)
        
        
    }
}
