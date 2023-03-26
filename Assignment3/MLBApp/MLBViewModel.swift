//
//  MLBViewModel.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import Foundation

    //The API I was using before had a 502 error so I had to switch APIs
    
    //    func fetchPlayers(searchQuery: String) {
    //        let encodedSearchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    //        let url = URL(string: "https://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code='mlb'&active_sw='Y'&name_part='\(encodedSearchQuery)'")!
    //
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let data = data {
    //                do {
    //                    let decoder = JSONDecoder()
    //                    let result = try decoder.decode(SearchResponse.self, from: data)
    //                    DispatchQueue.main.async {
    //                        self.players = Array(result.searchPlayerAll.queryResults.row.prefix(5))
    //                    }
    //                } catch {
    //                    print("Error decoding data: \(error)")
    //                }
    //            }
    //        }.resume()
    //    }
    
class MLBViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var playerStats: [PlayerStats] = []
    
    func fetchPlayers(searchQuery: String) {
        let encodedSearchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "https://www.thesportsdb.com/api/v1/json/3/searchplayers.php?p=\(encodedSearchQuery)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(TheSportsDBResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.players = Array(result.player.prefix(5))
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
    
    func fetchPlayerStats(playerID: String, completion: @escaping (Result<[PlayerStats], Error>) -> Void) {
        let url = URL(string: "https://www.thesportsdb.com/api/v1/json/3/lookupplayer.php?id=\(playerID)")!
    
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(PlayerStatsResponse.self, from: data)
                    completion(.success(result.players ?? []))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}


    
//    func fetchPlayerStats(playerID: Int, completion: @escaping (PlayerStats) -> Void) {
//        let url = URL(string: "https://lookup-service-prod.mlb.com/json/named.sport_hitting_tm.bam?league_list_id='mlb'&game_type='R'&season='2023'&player_id=\(playerID)")!
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let result = try decoder.decode(StatsResponse.self, from: data)
//                    if let stats = result.sportHittingTM.queryResults.row.first {
//                        DispatchQueue.main.async {
//                            completion(stats)
//                        }
//                    }
//                } catch {
//                    print("Error decoding data: \(error)")
//                }
//            }
//        }.resume()
//    }
//}

