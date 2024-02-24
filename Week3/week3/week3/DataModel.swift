//
//  DataModel.swift
//  week3
//
//  Created by Егор  Хлямов on 24.02.2024.
//

import Foundation

struct DataModel: Codable {
    let success: Bool
    let data: DataClass
}

struct DataClass: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount, captions: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
        case captions
    }
}

