//
//  Player.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation



//struct Player: Encodable, Decodable, Identifiable {
//    let id: Int
//    let fullName: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "player_id"
//        case fullName = "name_display_first_last"
//    }
//}

//New structure for other API since other one had server issues

struct Player: Identifiable, Codable {
    let idPlayer: String
    let strPlayer: String
    let strTeam: String?
    let strPosition: String?
    let strBirthLocation: String?
    let dateBorn: String?
    let strThumb: String?
    let strSport: String?
    let strNationality: String?
    let strDescriptionEN: String?

    var id: String {
        return idPlayer
    }
}
