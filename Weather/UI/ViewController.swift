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
    @IBOutlet weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("viewController deinit")
    }
    
    @IBAction func reloadButtonAction(sender: UIButton) {
        do {
            let weatherCondition = try YumemiWeather.fetchWeatherCondition(at: "tokyo")
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
        } catch {
            errAlart(WeatherError.apiError)
            return
        }
    }
    @IBAction func closeButtonAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    private func errAlart(_ error: WeatherError) {
        var title = "タイトル"
        var message = "メッセージ"
        if error == WeatherError.apiError {
            title = "apiエラー"
            message = "apiエラー"
        }
        
        let alart = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "はい", style: .default) { action in
            print(error)
        }
        alart.addAction(yesAction)
        present(alart, animated: true)
    }
}
