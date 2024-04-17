//
//  PostData.swift
//  H4XOR News
//
//  Created by Юлія Воробей on 17.04.2024.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let author: String
    let objectID: String
    let title: String
    let updated_at: String
    let url: String?
}

