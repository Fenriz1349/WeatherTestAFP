//
//  ContentView.swift
//  WeatherTestAFP
//
//  Created by Julien Cotte on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    var filtratedLocations: [Location] {
        search.isEmpty ?
        Location.locations :
        Location.locations.filter { $0.name.contains(search)}
    }
    @State var search: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("Météo")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack {
                    Color.gray.opacity(0.2)
                        .cornerRadius(10)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        TextField("ville ou aéroport", text: $search)
                            .padding(5)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                    }
                }
                .frame(height: 40)
                if filtratedLocations.isEmpty {
                    Text ("Il n'y a pas de villes correspondant à votre rechercher 😔")
                } else {
                    ScrollView {
                        ForEach(filtratedLocations) {location in
                            NavigationLink(destination: LocationDetail(location: location)) {
                                LocationRow(location: location)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
#Preview {
    ContentView()
}
