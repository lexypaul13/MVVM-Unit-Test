//
//  Users.swift
//  MVVM-Unit-Test
//
//  Created by Alex Paul on 1/26/22.
//

import Foundation


struct UserResposne: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Data]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage
        case total
        case totalPages
        case data 
    }
}

// MARK: - Datum
struct Data: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName
        case lastName
        case avatar
    }
}


