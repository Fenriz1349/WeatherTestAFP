//
//  LocationRow.swift
//  WeatherTestAFP
//
//  Created by Julien Cotte on 03/02/2025.
//

import SwiftUI

struct LocationRow: View {
    let location: Location
    var body: some View {
        ZStack {
            Image(location.condition.getImage())
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            HStack{
                VStack(alignment: .leading) {
                    Text(location.name)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .padding(.bottom, 1)
                    Text("12:00")
                        .font(.system(size: 12))
                    Spacer()
                    Text(location.condition.rawValue)
                        .font(.system(size: 12))
                }
                Spacer()
                VStack {
                    Text(location.celsiusString)
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                    Spacer()
                }
            }
            .padding()
        }
        .frame(height: 120)
        .foregroundStyle(.white)
    }
}

#Preview {
    LocationRow(location: Location.locations.first!)
}
