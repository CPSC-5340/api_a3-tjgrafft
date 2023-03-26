//
//  SearchResponse.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

struct SearchResponse: Codable {
    let searchPlayerAll: SearchPlayerAll

    enum CodingKeys: String, CodingKey {
        case searchPlayerAll = "search_player_all"
    }
}
