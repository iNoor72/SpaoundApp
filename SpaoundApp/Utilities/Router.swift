//
//  Router.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static var baseURL = "http://localhost:3000"
    
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
    
    var path: String {
        switch self {
        case .popularPlaces:
            return "/popular"
        case .recommendedPlaces:
            return "/recommended"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        //Implement some code here
        let url = URL(string: Router.baseURL)
        let request = URLRequest(url: (url?.appendingPathComponent(path))!)
        return request
    }
}
