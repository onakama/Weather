//
//  Response.swift
//  Weather
//
//  Created by onakama on 2022/09/04.
//

import Foundation
struct Response: Codable{
    let maxTemperature: Int
    let minTemperature: Int
    let weatherCondition: WeatherCondition
}
