//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct CurrentWeather: Decodable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    
    init(value: [String: Any]) {
        let weatherDict = value["weather"] as? [[String: Any]] ?? [[:]]
        let mainDict = value["main"] as? [String: Any] ?? [:]
        
        name = value["name"] as? String
        weather = [Weather(values: weatherDict)]
        main = Main(value: mainDict)
    }
}
