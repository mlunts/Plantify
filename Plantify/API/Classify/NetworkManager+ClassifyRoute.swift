//
//  NetworkManager+ClassifyRoute.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

extension NetworkManager {
    
    // MARK: - public
    func classifyFlower(from image: Image, onSuccess success: @escaping (_ flower: Flower?, _ response: Response?) -> Void, onFailure failure: @escaping ErrorWithVoid) {
        requestObject(ClassifyRoute.classifyFlower(image: image), onSuccess: success, onFailure: failure)
    }
}
