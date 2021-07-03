//
//  HomeRepository.swift
//  WatchOut
//
//  Created by Daniel on 7/3/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

enum HomeRepositoryError: Error, Equatable {
    case generic(errorMessage: String)
}

typealias HomeRepositoryState = RepositoryState<HomeRepositoryError>

class HomeRepository {
    
    private let dataSource: SearchShowDataSource
    
    var shows: Observable<[Show]> = .init([])
    var state: Observable<HomeRepositoryState> = .init(.idle)

    init(dataSource: SearchShowDataSource = RemoteSearchShowDataSource()) {
        self.dataSource = dataSource
    }
    
    func getShows(query: String) {
        self.state.value = .loading
        self.dataSource.getShows(query: query) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.state.value = .error(.generic(errorMessage: error.localizedDescription))
            case .success(let shows):
                self?.state.value = .loaded
                self?.shows.value = shows
            }
        }
    }
}
