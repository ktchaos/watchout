//
//  RemoteSearchService.swift
//  WatchOut
//
//  Created by Daniel on 6/21/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

struct ErrorMessageResponse: Codable, Error {
    let message: String
}

protocol SearchService {
    func fetchShows(with query: String, completion: @escaping (_ result: Result<[ListShowsResponse], Error>) -> Void)
}
