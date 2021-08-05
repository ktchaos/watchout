//
//  HomeViewModel.swift
//  WatchOut
//
//  Created by Daniel on 7/3/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var coordinator: HomeCoordinator?
    var homeRepository: HomeRepository
    var shows: Observable<[Show]>
    
    init(coordinator: HomeCoordinator, homeRepository: HomeRepository = HomeRepository()) {
        self.coordinator = coordinator
        self.homeRepository = homeRepository
        self.shows = .init([])
        self.bind(to: homeRepository)
    }
    
    private func bind(to homeRepository: HomeRepository) {
        homeRepository.shows.addAndNotify(observer: self) { shows in
            self.shows.value = shows
        }
        homeRepository.state.addAndNotify(observer: self) { state in
            //print(state)
        }
    }
    
    func searchShows(query: String) {
        homeRepository.getShows(query: query)
    }
    
    func selectedShowAt(index: Int) {
        let show = self.shows.value[index]
        self.coordinator?.openShowPopUp(show: show)
    }
}
