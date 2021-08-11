//
//  Weather.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct Weather: Decodable {
    var description: String?
    
    var weatherConditions: String {
        switch description {
        case "clear sky": return "sun.min.fill"
        case "few clouds": return "cloud.sun.fill"
        case "scattered clouds": return "cloud.fill"
        case "shower rain": return "cloud.rain.fill"
        case "rain": return "cloud.sun.rain"
        case "thunderstorm": return "cloud.bolt.fill"
        case "snow": return "cloud.snow.fill"
        case "mist": return "cloud.fog.fill"
        default: return "icloud.slash.fill"
        }
    }
    
    init(values: [[String: Any]]) {
        for value in values {
            description = value["description"] as? String
        }
    }
}
