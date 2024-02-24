//
//  ContentViewModel.swift
//  week3
//
//  Created by Егор  Хлямов on 24.02.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var meme: DataModel?
    @Published var searchText = ""
    
    init(meme: DataModel? = nil) {
        self.meme = meme
    }
    
    func loadData() {
        NetworkManager.shared.loadMeme(queryStr: searchText) { data in
            self.meme = data
        }
    }
}
