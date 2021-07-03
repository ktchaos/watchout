//
//  ListShows.swift
//  WatchOut
//
//  Created by Daniel on 6/21/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

struct ListShowsResponse: Codable {
    let score: Double
    let show: ShowResponse?
}
