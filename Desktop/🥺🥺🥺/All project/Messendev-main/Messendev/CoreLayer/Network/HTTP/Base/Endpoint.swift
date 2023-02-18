//
//  Endpoint.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var parametrs: [String:String]? { get }
    var header: [String:String]? { get }
    var body: [String:Any]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "set-our-main-url"
    }
}
