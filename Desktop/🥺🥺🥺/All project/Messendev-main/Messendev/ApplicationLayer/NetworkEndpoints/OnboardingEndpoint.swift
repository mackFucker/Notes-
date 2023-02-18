//
//  OnboardingEndpoint.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

enum OnboardingEndpoint {
    case downloadPages
}

extension OnboardingEndpoint: Endpoint {
    var path: String {
        switch self {
        case .downloadPages:
            return "/onboarding-pages"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .downloadPages:
            return .get
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
