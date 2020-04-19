//
//  FlowersListRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 18.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

enum FlowersListRoute {
    case listOfFlowers
}

extension FlowersListRoute: TargetType {
    
    var baseURL: URL {
//            return URL(string: "\(NetworkManager.baseServerPath)/api/orders")!
        return URL(string: "https://api.npoint.io/66730a334e0d6c93f14d")!
    }
    
    var path: String {
        switch self {
        case .listOfFlowers:
//            return "/all/flowers"
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .listOfFlowers:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .listOfFlowers:
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

extension FlowersListRoute: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}
