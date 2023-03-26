//
//  SportHittingTM.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

struct SportHittingTM: Codable {
    let queryResults: QueryResultsStats

    enum CodingKeys: String, CodingKey {
        case queryResults = "queryResults"
    }
}
