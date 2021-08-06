//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = "London"
        weatherStatusLabel.text = "Солнечно"
        currentTempLabel.text = "37"
        maximumTempLabel.text = "41"
        minimumTempLabel.text = "35"
    }
}

