//
//  SearchDataSource.swift
//  WatchOut
//
//  Created by Daniel on 6/30/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

protocol SearchShowDataSource {
    func getShows(query: String, completion: @escaping (_ result: Result<[Show], Error>) -> Void)
}
