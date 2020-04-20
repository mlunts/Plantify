//
//  NetworkManager+FlowersList.swift
//  Plantify
//
//  Created by Marina Lunts on 18.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import Moya

extension NetworkManager {
    
    // MARK: - public
    func listOfOrders(onSuccess success: @escaping (_ listOfFlowers: [Order]?, _ response: Response?) -> Void, onFailure failure: @escaping ErrorWithVoid) {
        requestObject(OrdersListRoute.listOfOrders, onSuccess: success, onFailure: failure)
    }
}
