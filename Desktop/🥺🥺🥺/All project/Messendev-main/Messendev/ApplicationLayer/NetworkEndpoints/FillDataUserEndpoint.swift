//
//  FillDataUserEndpoint.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

enum FillUserDataEndpoint {
    case sendUserInfo
}

extension FillUserDataEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .sendUserInfo:
            return "/UserInfo"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .sendUserInfo:
            return .post
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : Any]? {
        return nil
    }
    
    var parametrs: [String : String]? {
        return nil
    }
    
}
