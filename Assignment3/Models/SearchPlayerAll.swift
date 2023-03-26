//
//  SearchPlayerAll.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

struct SearchPlayerAll: Codable {
    let queryResults: QueryResultsPlayers

    enum CodingKeys: String, CodingKey {
        case queryResults = "queryResults"
    }
}
