//
//  Location.swift
//  WeatherTestAFP
//
//  Created by Julien Cotte on 03/02/2025.
//

import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let condition: Condition
    let temperature: Int
    
    static let locations: [Location] = [
        Location(name: "Lyon", condition: .sun, temperature: 25),
        Location(name: "Paris", condition: .clouds, temperature: 10),
        Location(name: "Marseille", condition: .snow, temperature: 1),
        Location(name: "Lille", condition: .rain, temperature: 17),
        Location(name: "Toulouse", condition: .beautiful, temperature: 8)
    ]
    
    var fahrenheit: Int {
        return Int(Double(temperature) * 9 / 5 + 32)
    }
    
    var celsiusString: String {
        return "\(temperature) °C"
    }
    
    var fahrenheitString: String {
        return "\(fahrenheit) °F"
    }
}

enum Condition: String {
    case sun = "Ensoleillé"
    case clouds = "Nuages prédominants"
    case snow = "Neige"
    case rain = "Pluie"
    case beautiful = "Belles éclaircies"
    
    func getImage() -> ImageResource {
        switch self {
        case.sun: return .sun
        case .clouds: return .clouds
        case .rain: return .rain
        case .snow: return .snow
        case .beautiful: return .beautifulClearing
        }
    }
    func getForegroundStyle() -> Color {
        switch self {
        case.sun: return .black
        case .clouds: return .black
        case .rain: return .white
        case .snow: return .white
        case .beautiful: return .black
        }
    }
}
