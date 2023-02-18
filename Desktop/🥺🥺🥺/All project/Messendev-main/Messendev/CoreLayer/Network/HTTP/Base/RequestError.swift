//
//  RequestError.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}
