//
//  PostModel.swift
//  APIDemo
//
//  Created by Kushal Rana on 27/03/23.
//

import Foundation

// MARK: - WelcomeElement
struct PostModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias postModelArray = [PostModel]
