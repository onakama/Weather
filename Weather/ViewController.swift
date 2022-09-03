//
//  ViewController.swift
//  Weather
//
//  Created by onakama on 2022/09/03.
//

import UIKit
import Foundation
import YumemiWeather

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var reloadButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadButtonAction(sender: UIButton) {
        print("aaaaaa")
        let weatherCondition = YumemiWeather.fetchWeatherCondition()
        print(weatherCondition)
        if weatherCondition == "sunny" {
            weatherImageView.image = UIImage(named: "Sunny")
            weatherImageView.tintColor = .red
        } else if weatherCondition == "rainy" {
            weatherImageView.image = UIImage(named: "Rainy")
            weatherImageView.tintColor = .blue
        } else if weatherCondition == "cloudy" {
            weatherImageView.image = UIImage(named: "Cloudy")
            weatherImageView.tintColor = .gray
        } else {
            weatherImageView.image = UIImage(named: "Sunny")
            weatherImageView.tintColor = .red
        }
        
    }

}

