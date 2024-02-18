//
//  ContentView.swift
//  ArtApp
//
//  Created by Егор  Хлямов on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State var artists: [Artist] = JsonParser.shared.convertArtistsFromJson()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(artists.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }, id: \.name) { artist in
                    NavigationLink(destination: ArtistDetailView(artist: artist)) {
                        HStack {
                            Image(artist.image)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                            Text(artist.name)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
