//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct PlayerListView: View {
    @EnvironmentObject var dataProvider : MLBViewModel
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Search for sports figures by last name")
                    .font(.headline)
                    .padding(.bottom, 8)

                HStack {
                    TextField("Enter last name", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        dataProvider.fetchPlayers(searchQuery: searchQuery)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, 16)

                List(dataProvider.players) { player in
                    NavigationLink(destination: PlayerStatsView(player: player).environmentObject(dataProvider)) {
                        Text(player.strPlayer)
                    }
                }
            }
            .padding()
            .navigationTitle("Players")
        }
    }
}


struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
            .environmentObject(MLBViewModel())
    }
}
