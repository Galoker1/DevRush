//
//  Artists.swift
//  ArtApp
//
//  Created by Егор  Хлямов on 18.02.2024.
//

import Foundation

struct Artists: Decodable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Decodable {
    
    let name, bio, image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Decodable {
    var id = UUID()
    let title, image, info: String
}
