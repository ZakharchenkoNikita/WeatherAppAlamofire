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
    var networkManager = NetworkWeatherManager.shared
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    // MARK: private methods
    private func getWeather() {
        networkManager.fetchWeather(city: "Berlin") { currentWeather in
            DispatchQueue.main.async {
                self.cityNameLabel.text = currentWeather.name
                self.currentTempLabel.text = self.getTempInСelsius(value: currentWeather.main?.temp ?? 0)
                self.maximumTempLabel.text = self.getTempInСelsius(value: currentWeather.main?.tempMax ?? 0)
                self.minimumTempLabel.text = self.getTempInСelsius(value: currentWeather.main?.tempMin ?? 0)
                
                currentWeather.weather?.forEach { weather in
                    self.weatherStatusLabel.text = weather.description
                }
            }
        }
    }
    
    private func getTempInСelsius(value: Double) -> String {
        String(format: "%.0f", value - 273.15)
    }
}
