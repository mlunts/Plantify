//
//  FlowerRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 19.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

enum FlowerRoute {
    case getFlower(id: Int)
}

extension FlowerRoute: TargetType {
    
    var baseURL: URL {
return URL(string: "\(NetworkManager.baseServerPath)/api")!
    }
    
    var path: String {
        switch self {
        case .getFlower:
            return "/flowers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFlower:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFlower(let id):
            return .requestParameters(parameters: ["": id], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

extension Flower: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}
