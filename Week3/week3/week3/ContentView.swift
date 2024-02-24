//
//  ContentView.swift
//  week3
//
//  Created by Егор  Хлямов on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            TextField("your question...", text: $viewModel.searchText)
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerSize: .zero)
                        .foregroundColor(Color.pink)
                        .cornerRadius(10)
                )
            Button {
                viewModel.loadData()
            } label: {
                Text("Go")
                    .foregroundColor(Color.white)
                    .padding()
            }
            .background(
                RoundedRectangle(cornerSize: .zero)
                    .foregroundColor(Color.pink)
                    .cornerRadius(10)
            )
            if let meme = viewModel.meme {
                VStack {
                            AsyncImage(url: URL(string: meme.data.memes[Int.random(in: 0...meme.data.memes.count) - 1].url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 200)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 200)
                    
                        }
                HStack {
                    Button {
                        viewModel.meme = nil
                        viewModel.searchText = ""
                    } label: {
                        Text("👍")
                            .padding(20)
                    }
                    .background(
                        RoundedRectangle(cornerSize: .zero)
                            .foregroundColor(Color.pink)
                            .cornerRadius(10)
                    )
                    Color.clear
                        .frame(width: 50, height: 1)
                    Button {
                        viewModel.loadData()
                    } label: {
                        Text("👎")
                            .padding(20)
                    }
                    .background(
                        RoundedRectangle(cornerSize: .zero)
                            .foregroundColor(Color.pink)
                            .cornerRadius(10)
                    )
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
