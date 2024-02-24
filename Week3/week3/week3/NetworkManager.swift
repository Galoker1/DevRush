//
//  NetworkManager.swift
//  week3
//
//  Created by Егор  Хлямов on 24.02.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func loadMeme(queryStr: String, completion: @escaping (DataModel) -> Void) {
        var urlComponents = URLComponents(string: "https://api.imgflip.com/get_memes")!

        guard let url = urlComponents.url else {
            print("Недопустимый URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Данные не получены")
                return
            }
            
            do {
                let stringdata = String(data: data, encoding: .utf8)
                let dataModel = try JSONDecoder().decode(DataModel.self, from: data)
                completion(dataModel)
            } catch {
                print("Ошибка разбора JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        
    }
}
