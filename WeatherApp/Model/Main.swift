//
//  Main.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct Main: Decodable {
    let temp: Double?
    let tempMin: Double?
    let tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    init(value: [String: Any]) {
        temp = value["temp"] as? Double
        tempMin = value["temp_min"] as? Double
        tempMax = value["temp_max"] as? Double
    }
}
