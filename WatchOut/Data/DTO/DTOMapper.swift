//
//  DTOMapper.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

protocol DTOMapper {
    associatedtype DataModel
    associatedtype DomainModel
    
    static func map(_ dto: DataModel) -> DomainModel
}
