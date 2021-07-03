//
//  ShowAPI.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import Moya

enum ShowAPI {
    case searchShow(query: String)
}

extension ShowAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.tvmaze.com")!
    }
    
    var path: String {
        switch self {
        case .searchShow:
            return "/search/shows"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchShow:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        var parameters = [String: Any]()
        
        switch self {
        case .searchShow(let query):
            parameters["q"] = query
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
