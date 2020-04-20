//
//  NetworkManager.swift
//  Plantify
//
//  Created by Marina Lunts on 18.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit
import Moya

typealias ErrorWithVoid = (_ error: Error, _ errorCode: Int?) -> Void
typealias SuccessResult<D: Decodable> = (_ object: D?, _ data: Response?) -> Void

class NetworkManager {
    
    // MARK: - properties
    
    static var baseServerPath: String {
        return Environment.baseServerPath
    }
    
    static let shared = NetworkManager()
    private var provider: MoyaProvider<MultiTarget>!
    
    // MARK: init
    
    private init() {
        setupProvider()
    }
    
    // MARK: - public
    
    func requestObject<T: TargetType, D: Decodable>(_ target: T, onSuccess success: @escaping SuccessResult<D>, onFailure failure: @escaping ErrorWithVoid) {
        provider.request(MultiTarget(target)) { [weak self] (result) in
            //todo: should change to more correct way.
            print("result: ", result)
            
            switch result {
            case .success(let response):
                self?.decoding(response.data, response, onSuccess: success, onFailure: failure)
            case .failure(let error):
                do {
                    if let url = URL(string: target.baseURL.absoluteString + target.path),
                        let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
                        
                        self?.decoding(cachedResponse.data, error.response, onSuccess: success, onFailure: failure)
                    }
                    
                    print("error: ", error)
                }
                
                failure(error, error.errorCode)
                
            }
        }
    }
    
    // MARK: - private
    
    private func decoding<D: Decodable>(_ data: Data, _ response: Response?, onSuccess success: @escaping SuccessResult<D>, onFailure failure: @escaping ErrorWithVoid) {
        do {
            guard data.isEmpty == false else {
                success(nil, response)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            let object = try decoder.decode(D.self, from: data)
            success(object, response)
        } catch let error {
            print("error: ", error)
            
            failure(error, nil)
        }
    }
    
    private func setupProvider() {
        let endpointClosure = { (target: MultiTarget) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            return defaultEndpoint
        }
        
        provider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, plugins: [CachePolicyPlugin()])
    }
}
