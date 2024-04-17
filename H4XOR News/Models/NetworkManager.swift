//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Юлія Воробей on 17.04.2024.
//

import Foundation

class NetworkManager: ObservableObject {
    let urlString = "http://hn.algolia.com/api/v1/search_by_date?tags=story"
    
    @Published var posts = [Post]()
    
    func fetchData () {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
