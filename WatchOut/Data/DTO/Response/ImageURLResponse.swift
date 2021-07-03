//
//  ImageURLResponse.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

struct ImageURLResponse: Codable {
    let medium: String?
    let original: String?
}

struct ImageURLResponseMapper: DTOMapper {
    static func map(_ dto: ImageURLResponse) -> ImageURL {
        var mediumUrl: URL? = nil
        var originalUrl: URL? = nil
        
        if let urlString = dto.medium {
            mediumUrl = URL(string: urlString)
        }
        
        if let urlStringOriginal = dto.original {
            originalUrl = URL(string: urlStringOriginal)
        }
        
        return ImageURL(medium: mediumUrl, original: originalUrl)
    }
}
