//
//  TappableService.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 19/02/2021.
//

import Foundation
import Alamofire

final class TappableNetworkManager: NSObject {

    private override init() {}

    static let _shared = TappableNetworkManager()

    class func shared()-> TappableNetworkManager {
        return _shared
    }
}

extension TappableNetworkManager {
    func fetchDataWith(completion: @escaping (Result<Data, Error>) -> Void) {

        AF.request(TappableAPIRouter.fetchAllRockets)
            .validate()
            .responseJSON { (response) in
                guard let data = response.data else {
                    let err = NSError(domain: "Unknown", code: 0, userInfo: nil)
                    completion(.failure(err))
                    return
                }
                completion(.success(data))
            }
    }
}
