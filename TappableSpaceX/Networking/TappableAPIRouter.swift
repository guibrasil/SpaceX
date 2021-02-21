//
//  TappableAPIRouter.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import Foundation
import Alamofire

public enum TappableAPIRouter: URLRequestConvertible {

    static let baseURL = APIConstants.DEV.baseURL

    case fetchAllRockets

    private var method: HTTPMethod {
        switch self {

        case .fetchAllRockets:
            return .get
        }
    }

    public func asURLRequest() throws -> URLRequest {
        let url = try TappableAPIRouter.baseURL.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }


}
