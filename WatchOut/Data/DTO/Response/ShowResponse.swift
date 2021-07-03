//
//  ShowResponse.swift
//  WatchOut
//
//  Created by Daniel on 6/17/21.
//  Copyright © 2021 Catarina Serrano. All rights reserved.
//

import Foundation

struct ShowResponse: Codable {
    let id: Int
    let name: String
    let language: String
    let genres: [String]
    let status: String
    let image: ImageURLResponse?
    let summary: String?
}

struct ShowResponseMapper: DTOMapper {
    static func map(_ dto: ShowResponse) -> Show {
        var image: ImageURLResponse = ImageURLResponse(medium: nil, original: nil)
        
        if let imageUrl = dto.image {
            image = imageUrl
        }
        
        return Show(id: dto.id,
                    name: dto.name,
                    language: dto.language,
                    genres: dto.genres,
                    status: dto.status,
                    image: ImageURLResponseMapper.map(image),
                    summary: dto.summary)
    }
}

