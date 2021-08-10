//
//  Weather.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct Weather: Decodable {
    var description: String?
    
    init(values: [[String: Any]]) {
        for value in values {
            description = value["description"] as? String
        }
    }
}
