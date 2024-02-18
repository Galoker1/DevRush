//
//  ArtistDetail.swift
//  ArtApp
//
//  Created by Егор  Хлямов on 18.02.2024.
//

import Foundation
import SwiftUI

struct ArtistDetailView: View {
    @State var artist: Artist
    @State var selectedArt: Work?
    @State var isOpenDetailArt: Bool = false
    var body: some View {
        VStack {
            VStack {
                Text(artist.name)
                Image(artist.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                Text(artist.bio)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(artist.works, id: \.id) { art in
                            VStack {
                                Image(art.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .onTapGesture {
                                        selectedArt = art
                                        isOpenDetailArt = true
                                    }
                                    .fullScreenCover(isPresented: $isOpenDetailArt) {
                                        PictureDetailView(picture: art, isPresented: $isOpenDetailArt)
                                            }
                            }
                        }
                    }
                }
                Spacer()
                
            }
        }
    }
}
