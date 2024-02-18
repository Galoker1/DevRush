//
//  JsonParser.swift
//  ArtApp
//
//  Created by Егор  Хлямов on 18.02.2024.
//

import Foundation

class JsonParser {
    static var shared = JsonParser()
    
    private init() {}
    
    func convertArtistsFromJson() -> [Artist] {
        let data = readJSONFromFile()
        guard let data = data else { return [] }
        let decoder = JSONDecoder()
            do {
                let users = try decoder.decode(Artists.self, from: data)
                return users.artists
            } catch {
                // Обработка ошибок при парсинге JSON
                print("Error parsing JSON:", error.localizedDescription)
            }
        return []
    }
    
    private func readJSONFromFile() -> Data? {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("Error reading JSON file:", error.localizedDescription)
            }
        }
        return nil
    }
}
