//
//  NetworkManager+Flower.swift
//  Plantify
//
//  Created by Marina Lunts on 19.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

extension NetworkManager {
    
    // MARK: - public
    func getFlower(by id: Int, onSuccess success: @escaping (_ flower: Flower?, _ response: Response?) -> Void, onFailure failure: @escaping ErrorWithVoid) {
        requestObject(FlowerRoute.getFlower(id: id), onSuccess: success, onFailure: failure)
    }
}
