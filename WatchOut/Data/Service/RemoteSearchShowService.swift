//
//  RemoteService.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation
import Moya

class RemoteSearchService: SearchService {
    private let provider = MoyaProvider<ShowAPI>()
    
    func fetchShows(with query: String, completion: @escaping (Result<[ListShowsResponse], Error>) -> Void) {
        self.provider.request(.searchShow(query: query)) { result in
            
            switch result {
            case .success(let response):
                do {
                    let listResponse = try response.map([ListShowsResponse].self)
                    completion(.success(listResponse))
                }
                catch {
                    let errorResponse = try? response.map(ErrorMessageResponse.self)
                    completion(.failure(errorResponse ?? ErrorMessageResponse(message: "Sorry, was not possible to find shows")))
                }
                
            case .failure:
                completion(.failure(ErrorMessageResponse(message: "Network error conection")))
            }
        }
    }
    
}
