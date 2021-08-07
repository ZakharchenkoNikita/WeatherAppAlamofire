//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    
    // MARK: properties
    var networkManager = NetworkWeatherManager()
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    // MARK: private methods
    private func getWeather() {
        networkManager.fetchCurrentWeather(city: "London") { currentWeather in
            DispatchQueue.main.async {
                self.cityNameLabel.text = currentWeather.name
                self.currentTempLabel.text = self.getTempInСelsius(value: currentWeather.main.temp)
                self.maximumTempLabel.text = self.getTempInСelsius(value: currentWeather.main.temp_max)
                self.minimumTempLabel.text = self.getTempInСelsius(value: currentWeather.main.temp_min)
                
                currentWeather.weather.forEach { weather in
                    self.weatherStatusLabel.text = weather.description
                }
            }
        }
    }
    
    private func getTempInСelsius(value: Double) -> String {
        String(format: "%.0f", value - 273.15)
    }
}
