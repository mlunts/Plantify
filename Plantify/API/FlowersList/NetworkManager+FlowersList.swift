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
    func listOfFlowers(onSuccess success: @escaping (_ listOfRooms: [String]?, _ response: Response?) -> Void, onFailure failure: @escaping ErrorWithVoid) {
        requestObject(FlowersListRoute.listOfFlowers, onSuccess: success, onFailure: failure)
    }
}
