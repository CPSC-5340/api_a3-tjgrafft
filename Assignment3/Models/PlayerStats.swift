//
//  PlayerStats.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

//New structure for properties from new API endpoint
struct PlayerStats: Codable {
    let idPlayer: String
    let strPlayer: String
    let strTeam: String
    let strPosition: String?
    let strBirthLocation: String?
    let dateBorn: String?
    let strThumb: String?
    let strSport: String
    let strNationality: String
    let strDescriptionEN: String?
}






//struct PlayerStats: Encodable, Decodable {
//    let avg: String
//    let slg: String
//    let ops: String
//    let hr: String
//    let rbi: String
//    let r: String
//
//    enum CodingKeys: String, CodingKey {
//        case avg
//        case slg
//        case ops
//        case hr
//        case rbi
//        case r
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        avg = try container.decode(String.self, forKey: .avg)
//        slg = try container.decode(String.self, forKey: .slg)
//        ops = try container.decode(String.self, forKey: .ops)
//        hr = try container.decode(String.self, forKey: .hr)
//        rbi = try container.decode(String.self, forKey: .rbi)
//        r = try container.decode(String.self, forKey: .r)
//    }
//}
