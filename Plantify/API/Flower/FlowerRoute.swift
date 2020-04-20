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
//            return URL(string: "\(NetworkManager.baseServerPath)/api/orders")!
        return URL(string: "https://api.npoint.io/66730a334e0d6c93f14d")!
    }
    
    var path: String {
        switch self {
        case .getFlower:
//            return "/all/flowers"
            return ""
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
//        case .getFlower(let id):
//            return .requestParameters(parameters: ["id": id], encoding: JSONEncoding.default)
        case .getFlower:
            return .requestPlain
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
