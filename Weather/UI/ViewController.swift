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
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("viewController deinit")
    }
    
    @IBAction func reloadButtonAction(sender: UIButton) {
        do {
            let model = WeatherModel()
            let response = try model.fatch()
            weatherImageView.set(response.weatherCondition)
            minTemperatureLabel.text = String(response.minTemperature)
            maxTemperatureLabel.text = String(response.maxTemperature)
        } catch let error{
            errAlart(error)
            return
        }
    }
    @IBAction func closeButtonAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    private func errAlart(_ error: Error) {
        var title = "タイトル"
        var message = "メッセージ"
        if error as! WeatherError == WeatherError.apiError {
            title = "apiエラー"
            message = "apiエラー"
        } else if error as! WeatherError == WeatherError.decodeError {
            title = "decodeエラー"
            message = "decodeエラー"
        }
        
        let alart = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "はい", style: .default) { action in
            print(error)
        }
        alart.addAction(yesAction)
        present(alart, animated: true)
    }
    
}

extension UIImageView {
    func set(_ weather: WeatherCondition) {
        switch weather {
        case .sunny:
            self.image = UIImage(named: "Sunny")
            self.tintColor = .red
        case .cloudy:
            self.image = UIImage(named: "Cloudy")
            self.tintColor = .gray
        case .rainy:
            self.image = UIImage(named: "Rainy")
            self.tintColor = .blue
        }
    }
}
