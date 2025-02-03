//
//  LocationDetail.swift
//  WeatherTestAFP
//
//  Created by Julien Cotte on 03/02/2025.
//

import SwiftUI

struct LocationDetail: View {
    @State var isCelcius: Bool = true
    let location: Location
    var body: some View {
        ZStack {
            Image(location.condition.getImage())
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack{
                Text(location.name)
                    .fontWeight(.bold)
                    .font(.system(size: 60))
                    .padding(.bottom, 30)
                    .padding(.top, 80)
                Text(isCelcius ? location.celsiusString : location.fahrenheitString)
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .padding(.bottom, 60)
                Text("12:00")
                    .font(.system(size: 24))
                Text(location.condition.rawValue)
                    .font(.system(size: 24))
                    .padding(.bottom, 30)
                Toggle(isOn: $isCelcius) {
                    Text("Afficher\nen \(isCelcius ?  "Celsius": "Fahrenheit")")
                        .font(.system(size: 18))
                        .padding(.horizontal)
                }
                .toggleStyle(SwitchToggleStyle(tint: .gray))
                .frame(width: 200)
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(location.condition.getForegroundStyle())
    }
}

#Preview {
    LocationDetail(location: Location.locations.first!)
}
