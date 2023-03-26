//
//  StatsResponse.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

struct StatsResponse: Codable {
    let sportHittingTM: SportHittingTM

    enum CodingKeys: String, CodingKey {
        case sportHittingTM = "sport_hitting_tm"
    }
}
