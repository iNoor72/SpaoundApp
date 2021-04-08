//
//  Router.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static var baseURL = {"localhost:3000"}
    
    case popularPlaces
    case recommendedPlaces
    
    var method: HTTPMethod {
        switch self {
        case .popularPlaces:
            return .get
        case .recommendedPlaces:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        //Implement some code here
        return URLRequest(url: (URL(string: "")!))
    }
}
