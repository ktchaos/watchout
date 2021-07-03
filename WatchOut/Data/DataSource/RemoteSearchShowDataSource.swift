//
//  RemoteSearchShowDataSource.swift
//  WatchOut
//
//  Created by Daniel on 6/30/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

class RemoteSearchShowDataSource: SearchShowDataSource {
    
    private let service: SearchService
    
    init(service: SearchService = RemoteSearchService()) {
        self.service = service
    }
    
    func getShows(query: String, completion: @escaping (Result<[Show], Error>) -> Void) {
        self.service.fetchShows(with: query) { result in
            switch result {
            case .success(let listOfShows):
                var shows = [Show]()
                for show in listOfShows {
                    let showMapped = ShowResponseMapper.map(show.show!)
                    shows.append(showMapped)
                }
                completion(.success(shows))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
