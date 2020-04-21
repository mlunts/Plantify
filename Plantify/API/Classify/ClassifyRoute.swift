//
//  ClassifyRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

enum ClassifyRoute {
    case classifyFlower(imageData: String)
}

extension ClassifyRoute: TargetType {
    
    var baseURL: URL {
        return URL(string: "\(NetworkManager.baseServerPath)/api")!
    }
    
    var path: String {
        switch self {
        case .classifyFlower:
            return "/classify"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .classifyFlower:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .classifyFlower(let data):
            return .requestParameters(parameters: ["imageFile": data], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

extension ClassifyRoute: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}

