//
//  OrdersListRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 19.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

enum OrdersListRoute {
    case listOfOrders
}

extension OrdersListRoute: TargetType {
    
    var baseURL: URL {
//            return URL(string: "\(NetworkManager.baseServerPath)/api/orders")!
        return URL(string: "https://api.npoint.io/c8d38ebec6d103d3d8d5")!
    }
    
    var path: String {
        switch self {
        case .listOfOrders:
//            return "/all/flowers"
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .listOfOrders:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .listOfOrders:
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

extension OrdersListRoute: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}
