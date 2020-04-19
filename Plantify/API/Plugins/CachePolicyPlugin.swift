//
//  CachePolicyPlugin.swift
//  Plantify
//
//  Created by Marina Lunts on 18.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
            return mutableRequest
        }

        return request
    }
}
