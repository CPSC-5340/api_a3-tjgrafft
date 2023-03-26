//
//  PlayerStatsView.swift
//  Assignment3
//
//  Created by Taylor Grafft on 3/26/23.
//

import SwiftUI

//New PlayerStatsView with new API endpoint


struct PlayerStatsView: View {
    let player: Player
    @EnvironmentObject private var dataProvider: MLBViewModel
    @State private var playerStats: PlayerStats?

    var body: some View {
        VStack {
            if let playerStats = playerStats {
                VStack {
                    VStack {
                        AsyncImage(url: player.strThumb.flatMap { URL(string: $0) }) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 150, height: 150)

                        VStack(alignment: .leading, spacing: 8) {
                            Text(player.strPlayer)
                                .font(.title)
                            Text("\(player.strPosition ?? "Unknown Position") | \(player.strTeam ?? "Unknown Team")")
                                .font(.subheadline)
                            Text("\(player.strSport ?? "Unknown Sport") | \(player.strNationality ?? "Unknown Nationality")")
                                .font(.subheadline)

                        }
                        .padding(.top, 8)

                        Divider()
                        ScrollView {
                            Text(playerStats.strDescriptionEN ?? "No description available.")
                                .padding(.top, 8)
                        }
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            dataProvider.fetchPlayerStats(playerID: player.idPlayer) { result in
                switch result {
                case .success(let playerStats):
                    self.playerStats = playerStats.first
                case .failure(let error):
                    print(error)
                }
            }
        }
        .navigationTitle(player.strPlayer)
    }
}




//struct PlayerStatsView: View {
//    let player: PlayerStats
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 8) {
//                Text("Name: \(player.strPlayer)")
//                    .font(.headline)
//
//                Text("Position: \(player.strPosition)")
//                    .font(.headline)
//
//                Text("Team: \(player.strTeam)")
//                    .font(.headline)
//
//                Text("Sport: \(player.strSport)")
//                    .font(.headline)
//
//                Text("Nationality: \(player.strNationality)")
//                    .font(.headline)
//
//                Text("Description:")
//                    .font(.headline)
//
//                Text(player.strDescriptionEN)
//                    .font(.body)
//
//                Spacer()
//
//                if let url = URL(string: player.strThumb), let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150)
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Player Stats")
//    }
//}

//struct PlayerStatsView: View {
//    let player: Player
//    @StateObject private var dataProvider = MLBViewModel()
//    @State private var playerStats: PlayerStats?
//
//    var body: some View {
//        VStack {
//            if let stats = playerStats {
//                VStack(alignment: .leading) {
//                    Text("Average: \(stats.avg)")
//                    Text("Slugging Percentage: \(stats.slg)")
//                    Text("OPS: \(stats.ops)")
//                    Text("Homeruns: \(stats.hr)")
//                    Text("RBIs: \(stats.rbi)")
//                    Text("Runs: \(stats.r)")
//                }
//                .padding()
//            } else {
//                Text("Loading player stats...")
//                    .padding()
//            }
//        }
//        .navigationTitle(player.fullName)
//        .onAppear {
//            dataProvider.fetchPlayerStats(playerID: player.id) { stats in
//                playerStats = stats
//            }
//        }
//    }
//}

//struct PlayerStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerStatsView(player: Player(id: 0, fullName: "Sample Player"))
//    }
//}
