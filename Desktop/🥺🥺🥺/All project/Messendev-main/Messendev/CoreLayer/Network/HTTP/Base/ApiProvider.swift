//
//  ApiProvider.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

protocol ApiProviderPlugin {
    func prepare(_ request: URLRequest, endpoint: Endpoint) -> URLRequest
}

protocol ApiProvider {
//    var plugins: [ApiProviderPlugin] { get set }
    func requestPlain<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension ApiProvider {
//    var plugins: [ApiProviderPlugin] {
//        return []
//    }
    
    func requestPlain<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.parametrs?.compactMap { (key, value) in
                .init(name: key, value: value)
        }
        
        guard let url = urlComponents.url else {
            Log.error(RequestError.invalidURL)
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
//        for plugin in plugins {
//            request = plugin.prepare(request, endpoint: endpoint)
//        }
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            try Task.checkCancellation()
            
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    Log.error(RequestError.decode)
                    throw RequestError.decode
                }
                Log.info("Success")
                return decodedResponse
            case 401:
                Log.error(RequestError.unauthorized)
                throw RequestError.unauthorized
            default:
                Log.error(RequestError.unexpectedStatusCode)
                throw RequestError.unexpectedStatusCode
            }
        } catch {
            throw RequestError.unknown
        }
    }
}
