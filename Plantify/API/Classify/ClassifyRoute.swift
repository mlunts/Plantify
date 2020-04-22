//
//  ClassifyRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

enum ClassifyRoute {
    case classifyFlower(image: UIImage)
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
        case .classifyFlower(let image):
            let imageData = image.jpegData(compressionQuality: 1.0)
            
            let formData: [Moya.MultipartFormData] = [Moya.MultipartFormData(provider: .data(imageData!), name: "imageFile", fileName: "user.jpeg", mimeType: "image/jpeg")]
            
            return .uploadMultipart(formData)
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

