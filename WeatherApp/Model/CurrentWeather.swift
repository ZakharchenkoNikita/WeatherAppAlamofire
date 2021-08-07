//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct CurrentWeather: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}
