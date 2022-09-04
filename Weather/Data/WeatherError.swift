//
//  WeatherError.swift
//  Weather
//
//  Created by onakama on 2022/09/04.
//

import Foundation

enum WeatherError: Error, Codable {
    case apiError
    case decodeError
}
