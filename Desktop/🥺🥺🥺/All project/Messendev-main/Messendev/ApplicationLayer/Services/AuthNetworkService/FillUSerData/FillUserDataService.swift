//
//  FillUserDataService.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

struct UserDataMainCodable: Codable {
    let users: [UserDataCodable]
}

struct UserDataCodable: Codable {
    let name: String
    let phone: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case name, phone, email
    }
}

protocol FillUserDataServiceable {
    func sendUserData() async throws -> UserDataMainCodable
}

struct FillUserDataService: ApiProvider, FillUserDataServiceable {
    func sendUserData() async throws -> UserDataMainCodable {
        return try await requestPlain(endpoint: FillUserDataEndpoint.sendUserInfo,
                                      responseModel: UserDataMainCodable.self)
    }
}
