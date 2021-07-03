//
//  RepositoryState.swift
//  WatchOut
//
//  Created by Daniel on 7/3/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

enum RepositoryState<ErrorType: Equatable>: Equatable {
    case idle
    case loading
    case loaded
    case error(_ error: ErrorType)
}

